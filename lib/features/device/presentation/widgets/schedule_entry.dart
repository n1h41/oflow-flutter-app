import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oflow/core/constants/colors.dart';

import '../../domain/entity/schedule_entity.dart';

class ScheduleEntry extends StatelessWidget {
  final ScheduleEntity schedule;
  final Function(ScheduleEntity) onDelete;

  const ScheduleEntry({
    super.key,
    required this.schedule,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: KAppColors.containerBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: KAppColors.shadowColor.withValues(alpha: 0.1),
            blurRadius: 14,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('h:mm a').format(schedule.startTime),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: KAppColors.shadowColor),
                onPressed: () => onDelete(schedule),
              ),
            ],
          ),
          // add widget which shows the duration also
          Text(
            "Duration: ${schedule.duration} Minutes",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: KAppColors.shadowColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Row(
            children: [
              Expanded(
                child: _getScheduleDays(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Text _getScheduleDays(BuildContext context) {
    if (schedule.scheduleDays.length == 7) {
      return Text(
        "Everyday",
        style: Theme.of(context).textTheme.labelLarge,
      );
    }
    final days = schedule.scheduleDays;
    var scheduledDaysText = "";
    for (var i = 0; i < days.length; i++) {
      scheduledDaysText += getWeekdayName(days[i]);
      if (i != days.length - 1) {
        scheduledDaysText += ", ";
      }
    }
    return Text(
      scheduledDaysText,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  String getWeekdayName(int weekday) {
    final weekdays = [
      'SUN',
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
    ];

    return weekdays[weekday - 1];
  }
}
