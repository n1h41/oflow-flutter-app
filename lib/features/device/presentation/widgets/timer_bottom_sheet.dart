import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/constants/colors.dart';
import 'package:oflow/features/device/presentation/bloc/device_bloc.dart';
import 'package:oflow/features/device/presentation/bloc/device_state.dart';
import 'package:wheel_picker/wheel_picker.dart';

class TimerBottomSheet extends StatefulWidget {
  const TimerBottomSheet({
    super.key,
  });

  @override
  State<TimerBottomSheet> createState() => _TimerBottomSheetState();
}

class _TimerBottomSheetState extends State<TimerBottomSheet> {
  late final WheelPickerController hourWheelController;
  late final WheelPickerController minuteWheelController;

  final ValueNotifier<String> selectedDurationNotifier =
      ValueNotifier<String>("30Min");

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
          ValueListenableBuilder(
              valueListenable: selectedDurationNotifier,
              builder: (context, selectedDuration, _) {
                return Text(
                  "You currently have the running time set to $selectedDuration. To adjust the running time, please enter the desired new duration in minutes. Tap 'Save' to apply the changes.",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: KAppColors.textPrimary,
                      ),
                );
              }),
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
                              color: KAppColors.textPrimary.withOpacity(0.4),
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
                              color: KAppColors.textPrimary.withOpacity(0.4),
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

  void _handleUpdateTimerValue() {
    selectedDurationNotifier.value =
        "${selectedHour.toString().padLeft(2, "0")}:${selectedMinute.toString().padLeft(2, "0")}";
    // convert to minutes
    final durationInMins = (selectedHour * 60) + selectedMinute;
    final DeviceState state = context.read<DeviceBloc>().state;
    context.read<DeviceBloc>().publishToTopic(
          "C4DEE2879A60/vals",
          jsonEncode(
            state.deviceValueDetails?.copyWith(
              offTime: durationInMins.toString(),
            ),
          ),
        );
    context.pop();
  }
}
