import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  final int statusCode;
  final int epoch;

  const HistoryTile({
    super.key,
    required this.epoch,
    required this.statusCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Row(
        children: [
          Text(
            status,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                // show date from epoch
                DateTime.fromMillisecondsSinceEpoch(epoch * 1000)
                    .toString()
                    .substring(0, 10),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                // show time from epoch
                DateTime.fromMillisecondsSinceEpoch(epoch * 1000)
                    .toString()
                    .substring(11, 16),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get status {
    switch (statusCode) {
      case 0:
        return 'Pump off';
      case 1:
        return 'Pump on';
      case 3:
        return 'Timer exceeded';
      case 4:
        return 'Dry run';
      case 5:
        return 'Vaultage fault';
      default:
        return 'Unknown';
    }
  }
}
