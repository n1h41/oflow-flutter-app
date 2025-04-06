import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/entity/schedule_entity.dart';
import '../bloc/device_bloc.dart';
import '../bloc/device_state.dart';
import '../widgets/create_schedule_bottom_sheet.dart';
import '../widgets/schedule_entry.dart';

class ScheduleView extends StatelessWidget {
  final String deviceMac;

  const ScheduleView({super.key, required this.deviceMac});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KAppColors.containerBackground,
                  boxShadow: [
                    BoxShadow(
                      color: KAppColors.shadowColor.withValues(alpha: 0.1),
                      blurRadius: 14,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: KAppColors.containerBackground,
                  radius: 20,
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          "Schedule",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const CreateScheduleBottomSheet(),
            ),
            icon: const Icon(
              Icons.add_circle,
              color: KAppColors.accent,
            ),
          ),
        ],
      ),
      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          switch (state.status) {
            case DeviceStateStatus.initial:
              return const Center(
                child: Text("Initial"),
              );
            case DeviceStateStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DeviceStateStatus.error:
              return Center(
                child: Text(state.errorMessage ?? "An error occurred"),
              );
            case DeviceStateStatus.data:
              if (state.schedules.isEmpty) {
                return const Center(
                  child: Text("No schedules available"),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                itemCount: state.schedules.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: (context, index) {
                  final schedule = state.schedules[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    highlightColor: KAppColors.accent.withValues(alpha: 0.2),
                    onLongPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CreateScheduleBottomSheet(
                          schedule: schedule,
                        ),
                      );
                    },
                    child: ScheduleEntry(
                      schedule: schedule,
                      onDelete: (schedule) =>
                          _showDeleteConfirmation(context, schedule),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }

  void _handleDeleteSchedule() {}

  void _showDeleteConfirmation(BuildContext context, ScheduleEntity schedule) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Schedule'),
          content: const Text('Are you sure you want to delete this schedule?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: _handleDeleteSchedule,
              child: const Text(
                'Delete',
                style: TextStyle(color: KAppColors.textError),
              ),
            ),
          ],
        );
      },
    );
  }
}
