import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt5_client/mqtt5_browser_client.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

import '../../../../core/constants/exceptions/failure.dart';
import '../../../../core/utils/helpers/aws_helpers.dart';
import '../../../../core/utils/helpers/logger.dart';
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
    appLogger.i('Initializing MQTT client');
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
    await _connectToBroker();
  }

  Future<void> _connectToBroker() async {
    try {
      final status = await _mqttClient2?.connect();
      appLogger.i("MQTT Connection Status: $status");
      emit(
        state.copyWith(
          status: DeviceStateStatus.data,
        ),
      );
      _listenForMessages();
    } on MqttNoConnectionException catch (e) {
      appLogger.i('MQTT client exception - $e');
      _mqttClient2?.disconnect();
      emit(
        state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'MQTT client exception - $e',
          error: ServerFailure(message: "MQTT server error: $e"),
        ),
      );
    } on SocketException catch (e) {
      appLogger.i('No internet available - $e');
      _mqttClient2?.disconnect();
      emit(
        state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'Internet not available - $e',
          error: NoNetworkFailure(),
        ),
      );
    } catch (e) {
      appLogger.i('Exception - $e');
      _mqttClient2?.disconnect();
      emit(
        state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'Exception - $e',
          error: ServerFailure(message: "Exception: $e"),
        ),
      );
    }
  }

  _listenForMessages() {
    _mqttClient2?.updates.listen(
      (event) {
        for (MqttReceivedMessage message in event) {
          final topic = message.topic!.split('/').last;
          switch (topic) {
            case "status":
              appLogger.i('Received message: ${_convertMessageToMap(message)}');
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
              appLogger.i('Received message: ${_convertMessageToMap(message)}');
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
              appLogger.i('Received message: ${_convertMessageToMap(message)}');
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
              appLogger.i('Received message: $splittedValue');
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
    _mqttClient2?.subscribe(topic, qosLevel);
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
    appLogger
        .i('Publishing message to $topic: $message with id $msgIdentifier');
  }

  _convertMessageToMap(MqttReceivedMessage message) {
    MqttPublishMessage msg = message.payload as MqttPublishMessage;
    final msgString = MqttUtilities.bytesToStringAsString(msg.payload.message!);
    return jsonDecode(msgString);
  }

  @override
  Future<void> close() {
    _mqttClient2?.disconnect();
    return super.close();
  }
}
