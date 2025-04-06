import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oflow/features/device/presentation/bloc/device_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/entity/schedule_entity.dart';

class CreateScheduleBottomSheet extends StatefulWidget {
  final ScheduleEntity? schedule;
  final String deviceMac;

  const CreateScheduleBottomSheet({
    super.key,
    this.schedule,
    required this.deviceMac,
  });

  @override
  State<CreateScheduleBottomSheet> createState() =>
      _CreateScheduleBottomSheetState();
}

class _CreateScheduleBottomSheetState extends State<CreateScheduleBottomSheet> {
  final ValueNotifier<List<int>> selectedDaysNotifier = ValueNotifier([]);

  late final WheelPickerController startTimeHourWheelController;
  late final WheelPickerController startTimeMinuteWheelController;
  late final WheelPickerController amPmWheelController;

  late final WheelPickerController durationHourWheelController;
  late final WheelPickerController durationMinuteWheelController;

  int selectedStartTimeHour = 0;
  int selectedStartTimeMinute = 0;
  bool isAM = true; // true for AM, false for PM

  int selectedDurationHour = 0;
  int selectedDurationMinute = 0;

  @override
  void initState() {
    super.initState();
    startTimeHourWheelController = WheelPickerController(itemCount: 12);
    startTimeMinuteWheelController = WheelPickerController(itemCount: 60);
    amPmWheelController = WheelPickerController(itemCount: 2);

    durationHourWheelController = WheelPickerController(itemCount: 12);
    durationMinuteWheelController = WheelPickerController(itemCount: 60);

    if (widget.schedule != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initializeFromExistingSchedule();
      });
    }
  }

  void _initializeFromExistingSchedule() async {
    if (widget.schedule != null) {
      final schedule = widget.schedule!;

      // Convert 24-hour to 12-hour format
      int displayHour = schedule.startTime.hour % 12;
      if (displayHour == 0) displayHour = 12;
      isAM = schedule.startTime.hour < 12;

      // Set initial values
      selectedStartTimeHour = displayHour;
      selectedStartTimeMinute = schedule.startTime.minute;

      // Set initial values for duration
      selectedDurationHour = schedule.duration ~/ 60;
      selectedDurationMinute = schedule.duration % 60;

      // Animate wheels to correct positions
      await Future.wait([
        startTimeHourWheelController.shiftTo(
          index: displayHour,
        ),
        startTimeMinuteWheelController.shiftTo(
          index: schedule.startTime.minute,
        ),
        amPmWheelController.shiftTo(
          index: isAM ? 0 : 1,
        ),
        durationHourWheelController.shiftTo(
          index: selectedDurationHour,
        ),
        durationMinuteWheelController.shiftTo(
          index: selectedDurationMinute,
        ),
      ]);

      // Set selected days
      selectedDaysNotifier.value = schedule.scheduleDays;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 700,
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
          const SizedBox(height: 10),
          const Divider(),
          Text(
            "Starting Time",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: WheelPicker(
                          controller: startTimeHourWheelController,
                          onIndexChanged: (index) {
                            selectedStartTimeHour = index == 0 ? 12 : index;
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
                          controller: startTimeMinuteWheelController,
                          onIndexChanged: (index) {
                            selectedStartTimeMinute = index;
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
                        height: 17,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Duration",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: WheelPicker(
                          controller: durationHourWheelController,
                          onIndexChanged: (index) {
                            selectedDurationHour = index;
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
                          controller: durationMinuteWheelController,
                          onIndexChanged: (index) {
                            selectedDurationMinute = index;
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
              onPressed: _handleSaveSchedule,
              child: Text(widget.schedule == null ? "Create" : "Update"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelectionChips() {
    final dayNames = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return ValueListenableBuilder(
      valueListenable: selectedDaysNotifier,
      builder: (context, selectedDays, _) {
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
                backgroundColor: isSelected
                    ? KAppColors.accent
                    : KAppColors.containerBackground,
                showCheckmark: false,
                shape: CircleBorder(
                  side: BorderSide(
                    color: isSelected
                        ? KAppColors.accent
                        : KAppColors.textPrimary.withValues(alpha: 0.2),
                  ),
                ),
                onSelected: (value) {
                  if (value) {
                    selectedDays.add(weekday);
                  } else {
                    selectedDays.remove(weekday);
                  }
                  selectedDaysNotifier.value = List.from(selectedDays);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _handleSaveSchedule() {
    if (widget.schedule != null) {
      return _updateExistingSchedule();
    }
    _createSchedule();
  }

  void _updateExistingSchedule() {
    final startingTime = DateTime(
      0,
      0,
      0,
      isAM ? selectedStartTimeHour : selectedStartTimeHour + 12,
      selectedStartTimeMinute,
    );
    final duration = (selectedDurationHour * 60) + selectedDurationMinute;
    final updatedSchedule = widget.schedule!.copyWith(
      day: selectedDaysNotifier.value.join(','),
      duration: duration,
      time: DateFormat('HH:mm').format(startingTime).toString(),
    );
    context
        .read<DeviceBloc>()
        .updateSchedule(updatedSchedule, widget.deviceMac);
    Navigator.of(context).pop();
    return;
  }

  void _createSchedule() {
    final startingTime = DateTime(
      0,
      0,
      0,
      isAM ? selectedStartTimeHour : selectedStartTimeHour + 12,
      selectedStartTimeMinute,
    );
    final duration = (selectedDurationHour * 60) + selectedDurationMinute;
    final newSchedule = ScheduleEntity(
      id: const Uuid().v4(),
      day: selectedDaysNotifier.value.join(','),
      duration: duration,
      time: DateFormat('HH:mm').format(startingTime).toString(),
    );
    context.read<DeviceBloc>().createSchedule(newSchedule, widget.deviceMac);
    Navigator.of(context).pop();
    return;
  }
}
