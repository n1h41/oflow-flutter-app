import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../../core/constants/colors.dart';
import '../bloc/device_bloc.dart';
import '../bloc/device_state.dart';

class CreateScheduleBottomSheet extends StatefulWidget {
  final String deviceMac;

  const CreateScheduleBottomSheet({
    super.key,
    required this.deviceMac,
  });

  @override
  State<CreateScheduleBottomSheet> createState() =>
      _CreateScheduleBottomSheetState();
}

class _CreateScheduleBottomSheetState extends State<CreateScheduleBottomSheet> {
  late final WheelPickerController hourWheelController;
  late final WheelPickerController minuteWheelController;
  late final WheelPickerController amPmWheelController;

  int selectedHour = 0;
  int selectedMinute = 0;
  bool isAM = true; // true for AM, false for PM

  // Selected days of the week (1-7 where 1 is Monday, 7 is Sunday)
  final List<int> selectedDays = [];

  @override
  void initState() {
    super.initState();
    hourWheelController = WheelPickerController(itemCount: 12);
    minuteWheelController = WheelPickerController(itemCount: 60);
    amPmWheelController = WheelPickerController(itemCount: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 400,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Schedule",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          const Divider(),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: WheelPicker(
                          controller: hourWheelController,
                          onIndexChanged: (index) {
                            selectedHour = index == 0 ? 12 : index;
                          },
                          style: const WheelPickerStyle(
                            squeeze: 0.8,
                            diameterRatio: .5,
                            surroundingOpacity: .25,
                            magnification: 1,
                            itemExtent: 54 * 1.2,
                          ),
                          builder: (context, index) {
                            // Display 12 instead of 0
                            final displayValue = index == 0 ? 12 : index;
                            return Text(
                              displayValue.toString().padLeft(2, "0"),
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
                        "Min",
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
                          controller: amPmWheelController,
                          onIndexChanged: (index) {
                            isAM = index == 0;
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
                              index == 0 ? "AM" : "PM",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                  ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                          height: 17), // Adjust to align with other labels
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Select Days",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: _buildDaySelectionChips(),
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

  Widget _buildDaySelectionChips() {
    final dayNames = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        7,
        (index) {
          final weekday = index + 1; // 1-7 (Monday to Sunday)
          final isSelected = selectedDays.contains(weekday);

          return FilterChip(
            selected: isSelected,
            label: Text(
              dayNames[index],
              style: TextStyle(
                color: isSelected ? Colors.white : KAppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            selectedColor: KAppColors.accent,
            backgroundColor:
                isSelected ? KAppColors.accent : KAppColors.containerBackground,
            showCheckmark: false,
            shape: CircleBorder(
              side: BorderSide(
                color: isSelected
                    ? KAppColors.accent
                    : KAppColors.textPrimary.withValues(alpha: 0.2),
              ),
            ),
            onSelected: (value) {
              setState(() {
                if (value) {
                  selectedDays.add(weekday);
                } else {
                  selectedDays.remove(weekday);
                }
              });
            },
          );
        },
      ),
    );
  }

  void _handleUpdateTimerValue() {
    final durationInMins = (selectedHour * 60) + selectedMinute;
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
