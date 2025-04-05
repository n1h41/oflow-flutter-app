import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oflow/features/device/presentation/bloc/device_bloc.dart';
import 'package:oflow/features/device/presentation/bloc/device_state.dart';
import 'package:oflow/features/device/presentation/mixins/mqtt_mixin.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/history_tile.dart';

class HistoryView extends StatefulWidget {
  final String deviceMac;

  const HistoryView({super.key, required this.deviceMac});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> with MqttMixin {
  late final ValueNotifier<bool> isLoadingNotifier;
  late final ValueNotifier<List<int>> historyDataListNotifier;

  @override
  void initState() {
    super.initState();
    historyDataListNotifier = ValueNotifier<List<int>>([]);
  }

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
          "History",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            BlocBuilder<DeviceBloc, DeviceState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.deviceHistoryDatalist.length,
                    separatorBuilder: (context, _) => const Divider(),
                    itemBuilder: (context, index) {
                      // get last number of int
                      int statusCode =
                          state.deviceHistoryDatalist[index].remainder(10);
                      int epoch = state.deviceHistoryDatalist[index] ~/ 10;
                      return HistoryTile(
                        statusCode: statusCode,
                        epoch: epoch,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
