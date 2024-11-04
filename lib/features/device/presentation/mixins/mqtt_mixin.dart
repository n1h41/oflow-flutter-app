import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

import '../../../../core/utils/helpers/aws_helpers.dart';

mixin MqttMixin {
  static const String mqttServer = 'broker.emqx.io';
  static const int mqttPort = 1883;
  static const String mqttUser = 'flutter';

  late final MqttServerClient client;

  var devicMac = "C4DEE2879A60";
  var identityId = '';
  var signedUrl = '';

  Future<void> configureMqttClient() async {
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
    await _connectToBroker();
  }

  Future<void> _connectToBroker() async {
    try {
      // TODO:
      final status = await client.connect();
      debugPrint("MQTT Connection Status: $status");
      // _listenForMessages();
    } on Exception catch (e) {
      debugPrint('MQTT client exception - $e');
      client.disconnect();
    }
  }
}
