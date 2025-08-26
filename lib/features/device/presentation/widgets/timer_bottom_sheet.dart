import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/entity/vals_entity.dart';
import '../bloc/device_bloc.dart';
import '../bloc/device_state.dart';

class TimerBottomSheet extends StatefulWidget {
  final String deviceMac;

  const TimerBottomSheet({
    super.key,
    required this.deviceMac,
  });

  @override
  State<TimerBottomSheet> createState() => _TimerBottomSheetState();
}

class _TimerBottomSheetState extends State<TimerBottomSheet> {
  late final WheelPickerController hourWheelController;
  late final WheelPickerController minuteWheelController;

  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    hourWheelController = WheelPickerController(itemCount: 24);
    minuteWheelController = WheelPickerController(itemCount: 60);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 474,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "On & Off Timer",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          const Divider(),
          BlocBuilder<DeviceBloc, DeviceState>(
            builder: (context, state) => switch (state.status) {
              DeviceStateStatus.data => Text(
                  "You currently have the running time set to ${getDeviceTimerValue(state.deviceValueDetails)}. To adjust the running time, please enter the desired new duration in minutes. Tap 'Save' to apply the changes.",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: KAppColors.textPrimary,
                      ),
                ),
              _ => const SizedBox.shrink(),
            },
          ),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: WheelPicker(
                          controller: hourWheelController,
                          onIndexChanged: (index) {
                            selectedHour = index;
                          },
                          style: const WheelPickerStyle(
                            squeeze: 0.8,
                            diameterRatio: .5,
                            surroundingOpacity: .25,
                            magnification: 1,
                            itemExtent: 54 * 1.2,
                          ),
                          builder: (context, index) {
                            return Text(
                              index.toString().padLeft(2, "0"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500,
                                  ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Hour",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  KAppColors.textPrimary.withValues(alpha: 0.4),
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: WheelPicker(
                          controller: minuteWheelController,
                          onIndexChanged: (index) {
                            selectedMinute = index;
                          },
                          style: const WheelPickerStyle(
                            squeeze: 0.8,
                            diameterRatio: .5,
                            surroundingOpacity: .25,
                            magnification: 1,
                            itemExtent: 54 * 1.2,
                          ),
                          builder: (context, index) {
                            return Text(
                              index.toString().padLeft(2, "0"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500,
                                  ),
                            );
                          },
                        ),
                      ),
                      Text(
                        " Min",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  KAppColors.textPrimary.withValues(alpha: 0.4),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleUpdateTimerValue,
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }

  String getDeviceTimerValue(ValsEntity? vals) {
    if (vals == null) {
      return '00 min';
    }
    final timerValueInMins = int.tryParse(vals.offTime);
    if (timerValueInMins == null) {
      return '00 min';
    }
    if (timerValueInMins < 60) {
      return '${timerValueInMins.toString().padLeft(2, "0")} min';
    }
    final hours = timerValueInMins ~/ 60;
    final minutes = timerValueInMins % 60;
    return '${hours.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")}';
  }

  void _handleUpdateTimerValue() {
    final durationInMins = (selectedHour * 60) + selectedMinute;
    if (durationInMins == 0) {
      // Optionally show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Timer value cannot be zero.')),
      );
      return;
    }
    final DeviceState state = context.read<DeviceBloc>().state;
    context.read<DeviceBloc>().publishToTopic(
      "${widget.deviceMac}/vals",
      jsonEncode(
        state.deviceValueDetails?.copyWith(
          offTime: durationInMins.toString(),
        ),
      ),
    );
    context.pop();
  }
}
