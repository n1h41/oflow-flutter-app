import 'package:flutter/material.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

import '../../../../core/constants/colors.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late final MqttServerClient client;

  @override
  void initState() {
    super.initState();
    /* client = MqttServerClient.withPort(
      'broker.emqx.io',
      'flutter_client',
      443,
      maxConnectionAttempts: 2,
    ); */
  }

  _configureMqttClient() {
    client.logging(on: false);
    client.useWebSocket = true;
    client.secure = false;
    client.autoReconnect = true;
    client.disconnectOnNoResponsePeriod = 90;
    client.keepAlivePeriod = 30;
  }

  _subscribeToTopic() {
    client.subscribe("C4DEE2879A60/status", MqttQos.atLeastOnce);
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
            /* Expanded(
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
            const Divider(), */
            Expanded(
              child: StreamBuilder(
                stream: client.updates,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children: const [],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }

  @override
    void dispose() {
      client.disconnect();
      super.dispose();
    }
}
