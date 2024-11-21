import 'dart:convert';
import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  late final MqttServerClient _mqttClient;

  MqttConnectionState get mqttConnectionStatus =>
      _mqttClient.connectionStatus?.state ?? MqttConnectionState.disconnected;

  void initMqttClient() async {
    log('Initializing MQTT client');
    emit(state.copyWith(status: DeviceStateStatus.loading));
    await configureMqttClient();
  }

  Future<void> configureMqttClient() async {
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
    await _connectToBroker();
  }

  Future<void> _connectToBroker() async {
    try {
      final status = await _mqttClient.connect();
      debugPrint("MQTT Connection Status: $status");
      emit(
        state.copyWith(
          status: DeviceStateStatus.data,
        ),
      );
      _listenForMessages();
    } on MqttNoConnectionException catch (e) {
      debugPrint('MQTT client exception - $e');
      _mqttClient.disconnect();
      emit(
        state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'MQTT client exception - $e',
          error: ServerFailure(message: "MQTT server error: $e"),
        ),
      );
    }
  }

  _listenForMessages() {
    _mqttClient.updates.listen(
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
    _mqttClient.subscribe(topic, qosLevel);
  }

  void publishToTopic(
    String topic,
    String message, [
    MqttQos qosLevel = MqttQos.atMostOnce,
  ]) {
    final builder = MqttPayloadBuilder();
    builder.addString(message);
    final msgIdentifier =
        _mqttClient.publishMessage(topic, qosLevel, builder.payload!);
    debugPrint('Publishing message to $topic: $message with id $msgIdentifier');
  }

  _convertMessageToMap(MqttReceivedMessage message) {
    MqttPublishMessage msg = message.payload as MqttPublishMessage;
    final msgString = MqttUtilities.bytesToStringAsString(msg.payload.message!);
    return jsonDecode(msgString);
  }

  @override
  Future<void> close() {
    _mqttClient.disconnect();
    return super.close();
  }
}
