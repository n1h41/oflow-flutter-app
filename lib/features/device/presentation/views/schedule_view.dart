import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflow/features/device/presentation/bloc/device_bloc.dart';
import 'package:oflow/features/device/presentation/bloc/device_state.dart';
import 'package:oflow/features/device/presentation/widgets/schedule_entry.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/create_schedule_bottom_sheet.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

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
              builder: (context) => const CreateScheduleBottomSheet(
                deviceMac: "deviceMac",
              ),
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
                  vertical: 20,
                  horizontal: 16,
                ),
                itemCount: state.schedules.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: (context, index) {
                  final schedule = state.schedules[index];
                  return ScheduleEntry(schedule: schedule);
                },
              );
          }
        },
      ),
    );
  }
}
