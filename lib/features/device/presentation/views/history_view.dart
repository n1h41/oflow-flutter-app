import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:oflow/features/device/presentation/mixins/mqtt_mixin.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/history_tile.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> with MqttMixin {
  // late final MqttServerClient client;

  late final ValueNotifier<bool> isLoadingNotifier;
  late final ValueNotifier<List<int>> historyDataListNotifier;

  /* var devicMac = "C4DEE2879A60";
  var identityId = '';
  var signedUrl = ''; */

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = ValueNotifier<bool>(true);
    historyDataListNotifier = ValueNotifier<List<int>>([]);
    _initMqtt();
  }

  _initMqtt() async {
    isLoadingNotifier.value = true;
    await configureMqttClient();
    _listenForMessages();
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
            ValueListenableBuilder(
              valueListenable: isLoadingNotifier,
              builder: (context, isLoading, _) {
                return ValueListenableBuilder(
                  valueListenable: historyDataListNotifier,
                  builder: (context, historyList, _) {
                    if (isLoading) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (historyList.isEmpty) {
                      return const Expanded(
                        child: Center(
                          child: Text("No history found"),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: historyList.length,
                        separatorBuilder: (context, _) => const Divider(),
                        itemBuilder: (context, index) {
                          // get last number of int
                          int statusCode = historyList[index].remainder(10);
                          int epoch = historyList[index] ~/ 10;
                          return HistoryTile(
                            statusCode: statusCode,
                            epoch: epoch,
                          );
                        },
                      ),
                    );
                  },
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
    client.unsubscribeStringTopic("C4DEE2879A60/chats");
    client.disconnect();
    log('MQTT client disconnected');
    super.dispose();
  }

  /* _configureMqttClient() async {
    const port = 443;
    const region = 'us-east-1';
    // Your AWS IoT Core endpoint url
    const baseUrl = 'a82k06ko9a2kk-ats.iot.$region.amazonaws.com';
    const scheme = 'wss://';
    const urlPath = '/mqtt';
    // AWS IoT MQTT default port for websockets

    final AuthSession authSession = await Amplify.Auth.fetchAuthSession();
    final AWSCredentials credentials =
        authSession.toJson()["credentials"] as AWSCredentials;

    identityId = authSession.toJson()["identityId"] as String;

    signedUrl = getWebSocketURL(
      accessKey: credentials.accessKeyId,
      secretKey: credentials.secretAccessKey,
      sessionToken: credentials.sessionToken!,
      region: region,
      scheme: scheme,
      endpoint: baseUrl,
      urlPath: urlPath,
    );
    client = MqttServerClient.withPort(
      signedUrl,
      identityId,
      port,
      maxConnectionAttempts: 2,
    );
    client.logging(on: false);
    client.useWebSocket = true;
    client.secure = false;
    client.autoReconnect = true;
    client.disconnectOnNoResponsePeriod = 90;
    client.keepAlivePeriod = 30;
    final MqttConnectMessage connMess =
        MqttConnectMessage().withClientIdentifier(identityId);
    client.connectionMessage = connMess;
    _connectToBroker();
  } */

  /* void _connectToBroker() async {
    try {
      // TODO:
      final status = await client.connect();
      debugPrint("MQTT Connection Status: $status");
      _listenForMessages();
    } on Exception catch (e) {
      debugPrint('MQTT client exception - $e');
      client.disconnect();
    }
  } */

  _listenForMessages() {
    client.updates.listen(
      (event) {
        for (var message in event) {
          isLoadingNotifier.value = true;
          MqttPublishMessage msg = message.payload as MqttPublishMessage;
          final pt = MqttUtilities.bytesToStringAsString(msg.payload.message!);
          var splittedValue = pt.split(',');
          splittedValue.removeLast();
          splittedValue = splittedValue.reversed.toList();
          historyDataListNotifier.value =
              splittedValue.map((e) => int.parse(e)).toList();
          isLoadingNotifier.value = false;
        }
      },
    );
    // INFO: Subscribe to the topic
    _subscribeToTopic();
  }

  _subscribeToTopic() {
    client.subscribe("C4DEE2879A60/chats", MqttQos.atLeastOnce);
  }
}
