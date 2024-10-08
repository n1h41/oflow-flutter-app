import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  final String text;
  final String date;
  final String time;

  const HistoryTile({
    super.key,
    required this.text,
    required this.date,
    required this.time,
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
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Spacer(),
          Column(
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
