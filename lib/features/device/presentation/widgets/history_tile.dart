import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // show date from epoch
                DateFormat('dd-MM-yyyy').format(
                  DateTime.fromMillisecondsSinceEpoch(epoch * 1000),
                ),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                DateFormat('jm').format(
                  DateTime.fromMillisecondsSinceEpoch(epoch * 1000),
                ),
                // DateTime.fromMillisecondsSinceEpoch(epoch * 1000),
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
