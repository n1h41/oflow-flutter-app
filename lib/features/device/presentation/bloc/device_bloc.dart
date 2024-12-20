import 'dart:convert';
import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt5_client/mqtt5_browser_client.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:oflow/core/constants/exceptions/failure.dart';

import '../../../../core/utils/helpers/aws_helpers.dart';
import '../../domain/entity/device_status_entity.dart';
import '../../domain/entity/pow_entity.dart';
import '../../domain/entity/vals_entity.dart';
import 'device_state.dart';

class DeviceBloc extends Cubit<DeviceState> {
  DeviceBloc() : super(DeviceState.initial());

  MqttClient? _mqttClient2;

  MqttConnectionState get mqttConnectionStatus =>
      _mqttClient2?.connectionStatus?.state ?? MqttConnectionState.disconnected;

  void initMqttClient() async {
    log('Initializing MQTT client');
    emit(state.copyWith(status: DeviceStateStatus.loading));
    await configMqttClient();
  }

  Future<void> configMqttClient() async {
    var identityId = '';
    var signedUrl = '';
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
    if (kIsWeb) {
      _mqttClient2 = MqttBrowserClient.withPort(
        signedUrl,
        identityId,
        port,
        maxConnectionAttempts: 2,
      );
    } else {
      _mqttClient2 = MqttServerClient.withPort(
        signedUrl,
        identityId,
        port,
        maxConnectionAttempts: 2,
      );
      (_mqttClient2! as MqttServerClient).useWebSocket = true;
      (_mqttClient2! as MqttServerClient).secure = false;
    }
    _mqttClient2!.logging(on: false);
    _mqttClient2!.autoReconnect = true;
    _mqttClient2!.disconnectOnNoResponsePeriod = 90;
    _mqttClient2!.keepAlivePeriod = 30;
    final MqttConnectMessage connMess =
        MqttConnectMessage().withClientIdentifier(identityId);
    _mqttClient2!.connectionMessage = connMess;
    await _connectToBroker(_mqttClient2!);
  }

  /* Future<void> configureMqttBrowserClient() async {
    var identityId = '';
    var signedUrl = '';
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
    _mqttBrowserClient = MqttBrowserClient.withPort(
      signedUrl,
      identityId,
      port,
      maxConnectionAttempts: 2,
    );
    _mqttBrowserClient.logging(on: false);
    _mqttBrowserClient.autoReconnect = true;
    _mqttBrowserClient.disconnectOnNoResponsePeriod = 90;
    _mqttBrowserClient.keepAlivePeriod = 30;
    final MqttConnectMessage connMess =
        MqttConnectMessage().withClientIdentifier(identityId);
    _mqttBrowserClient.connectionMessage = connMess;
    await _connectToBroker(_mqttBrowserClient);
  }

  Future<void> configureMqttMobileClient() async {
    var identityId = '';
    var signedUrl = '';
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
    _mqttClient = MqttServerClient.withPort(
      signedUrl,
      identityId,
      port,
      maxConnectionAttempts: 2,
    );
    _mqttClient.logging(on: false);
    _mqttClient.useWebSocket = true;
    _mqttClient.secure = false;
    _mqttClient.autoReconnect = true;
    _mqttClient.disconnectOnNoResponsePeriod = 90;
    _mqttClient.keepAlivePeriod = 30;
    final MqttConnectMessage connMess =
        MqttConnectMessage().withClientIdentifier(identityId);
    _mqttClient.connectionMessage = connMess;
    await _connectToBroker(_mqttClient);
  } */

  Future<void> _connectToBroker(MqttClient client) async {
    try {
      final status = await client.connect();
      debugPrint("MQTT Connection Status: $status");
      emit(
        state.copyWith(
          status: DeviceStateStatus.data,
        ),
      );
      _listenForMessages(client);
    } on MqttNoConnectionException catch (e) {
      debugPrint('MQTT client exception - $e');
      client.disconnect();
      emit(
        state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'MQTT client exception - $e',
          error: ServerFailure(message: "MQTT server error: $e"),
        ),
      );
    }
  }

  _listenForMessages(MqttClient client) {
    client.updates.listen(
      (event) {
        for (MqttReceivedMessage message in event) {
          final topic = message.topic!.split('/').last;
          switch (topic) {
            case "status":
              debugPrint('Received message: ${_convertMessageToMap(message)}');
              emit(
                state.copyWith(
                  status: DeviceStateStatus.data,
                  isInitialDeviceStatus: false,
                  deviceStatus: DeviceStatusEntity.fromJson(
                    _convertMessageToMap(message),
                  ),
                ),
              );
              break;
            case "pow":
              debugPrint('Received message: ${_convertMessageToMap(message)}');
              emit(
                state.copyWith(
                  status: DeviceStateStatus.data,
                  devicePowerDetails: PowEntity.fromJson(
                    _convertMessageToMap(message),
                  ),
                ),
              );
              break;
            case "vals":
              debugPrint('Received message: ${_convertMessageToMap(message)}');
              emit(
                state.copyWith(
                  status: DeviceStateStatus.data,
                  deviceValueDetails: ValsEntity.fromJson(
                    _convertMessageToMap(message),
                  ),
                ),
              );
              break;
            case "chats":
              MqttPublishMessage msg = message.payload as MqttPublishMessage;
              final msgString =
                  MqttUtilities.bytesToStringAsString(msg.payload.message!);
              var splittedValue = msgString.split(',');
              splittedValue
                  .removeLast(); // INFO: Removing the last empty string
              splittedValue = splittedValue.reversed.toList();
              debugPrint('Received message: $splittedValue');
              emit(
                state.copyWith(
                  status: DeviceStateStatus.data,
                  deviceHistoryDatalist:
                      splittedValue.map((e) => int.parse(e)).toList(),
                ),
              );
              break;
            default:
              break;
          }
        }
      },
    );
  }

  void subscribeToTopic(String topic, [MqttQos qosLevel = MqttQos.atMostOnce]) {
    _mqttClient2!.subscribe(topic, qosLevel);
    /* if (kIsWeb) {
      _mqttBrowserClient.subscribe(topic, qosLevel);
    } else {
      _mqttClient.subscribe(topic, qosLevel);
    } */
  }

  void publishToTopic(
    String topic,
    String message, {
    MqttQos qosLevel = MqttQos.atMostOnce,
  }) {
    final builder = MqttPayloadBuilder();
    builder.addString(message);

    final msgIdentifier = _mqttClient2!.publishMessage(
      topic,
      qosLevel,
      builder.payload!,
      retain: true,
    );
    /* if (kIsWeb) {
      msgIdentifier = _mqttBrowserClient.publishMessage(
        topic,
        qosLevel,
        builder.payload!,
        retain: true,
      );
    } else {
      msgIdentifier = _mqttClient.publishMessage(
        topic,
        qosLevel,
        builder.payload!,
        retain: true,
      );
    } */
    /* final msgIdentifier = _mqttClient.publishMessage(
      topic,
      qosLevel,
      builder.payload!,
      retain: true,
    ); */
    debugPrint('Publishing message to $topic: $message with id $msgIdentifier');
  }

  _convertMessageToMap(MqttReceivedMessage message) {
    MqttPublishMessage msg = message.payload as MqttPublishMessage;
    final msgString = MqttUtilities.bytesToStringAsString(msg.payload.message!);
    return jsonDecode(msgString);
  }

  @override
  Future<void> close() {
    _mqttClient2?.disconnect();
    /* if (kIsWeb) {
      _mqttBrowserClient.disconnect();
    } else {
      _mqttClient.disconnect();
    } */
    return super.close();
  }
}
