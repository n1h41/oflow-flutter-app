import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/history_tile.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

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
                      color: KAppColors.shadowColor.withOpacity(0.1),
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
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, _) => const Divider(),
                itemBuilder: (context, _) => const HistoryTile(
                  text: "Pump running",
                  date: "23 Sep, 2024",
                  time: "12:00",
                ),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
