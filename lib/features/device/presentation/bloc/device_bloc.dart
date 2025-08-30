import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:oflow/features/device/data/mqtt_service.dart';
import 'package:oflow/features/device/domain/entity/schedule_entity.dart';

import '../../../../core/utils/helpers/logger.dart';
import '../../domain/entity/device_status_entity.dart';
import '../../domain/entity/pow_entity.dart';
import '../../domain/entity/vals_entity.dart';
import '../../../../core/utils/helpers/vals_publisher_log.dart';
import 'device_state.dart';

class DeviceBloc extends Cubit<DeviceState> {
  final MqttService _mqttService;

  DeviceBloc({required MqttService mqttService})
      : _mqttService = mqttService,
        super(DeviceState.initial());

  final List<StreamSubscription> _topicSubscriptions = [];

  /// Set device ID and subscribe to its topics
  void setDeviceAndSubscribe(String deviceId) {
    _mqttService.setDeviceId(deviceId);
    _subscribeToDeviceTopics();
  }

  /// Subscribe to all device-specific topics
  void _subscribeToDeviceTopics() {
    // Subscribe to status topic
    final statusStream = _mqttService.subscribeToDeviceTopic('status');
    _topicSubscriptions.add(
      statusStream.listen((message) {
        try {
          final deviceStatus = DeviceStatusEntity.fromJson(jsonDecode(message));
          emit(state.copyWith(
            status: DeviceStateStatus.data,
            deviceStatus: deviceStatus,
          ));
        } catch (e) {
          AppLogger.instance.e('Failed to parse status: $e');
        }
      }),
    );

    // Subscribe to power topic
    final powStream = _mqttService.subscribeToDeviceTopic('pow');
    _topicSubscriptions.add(
      powStream.listen((message) {
        try {
          final powerDetails = PowEntity.fromJson(jsonDecode(message));
          emit(state.copyWith(
            status: DeviceStateStatus.data,
            devicePowerDetails: powerDetails,
          ));
        } catch (e) {
          AppLogger.instance.e('Failed to parse power details: $e');
        }
      }),
    );

    // Subscribe to vals topic
    final valsStream = _mqttService.subscribeToDeviceTopic('vals');
    _topicSubscriptions.add(
      valsStream.listen((message) {
        _handleValsMessage(message);
      }),
    );

    // Subscribe to charts topic
    final chartsStream = _mqttService.subscribeToDeviceTopic('chats');
    _topicSubscriptions.add(
      chartsStream.listen((message) {
        _handleChartsMessage(message);
      }),
    );

    // Subscribe to schedule topic
    final scheduleStream = _mqttService.subscribeToDeviceTopic('schedule');
    _topicSubscriptions.add(
      scheduleStream.listen((message) {
        _handleScheduleMessage(message);
      }),
    );
  }

  /// Handle vals topic messages
  void _handleValsMessage(String message) async {
    if (message == "null") {
      final lastVal = await ValsPublisherLog.get();
      if (lastVal != null) {
        try {
          final jsonStart = lastVal.indexOf('] ');
          final jsonStr =
              jsonStart != -1 ? lastVal.substring(jsonStart + 2) : lastVal;
          final valsEntity = ValsEntity.fromJson(jsonDecode(jsonStr));
          emit(state.copyWith(
            status: DeviceStateStatus.data,
            deviceValueDetails: valsEntity,
          ));
        } catch (e) {
          AppLogger.instance.e('Failed to parse last published vals: $e');
          emit(state.copyWith(
            status: DeviceStateStatus.error,
            errorMessage: 'Failed to parse last published vals',
          ));
        }
      } else {
        AppLogger.instance.e('No last published vals value available');
        emit(state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'No last published vals value available',
        ));
      }
    } else {
      try {
        final valsEntity = ValsEntity.fromJson(jsonDecode(message));
        emit(state.copyWith(
          status: DeviceStateStatus.data,
          deviceValueDetails: valsEntity,
        ));
      } catch (e) {
        AppLogger.instance.e('Failed to parse vals: $e');
        emit(state.copyWith(
          status: DeviceStateStatus.error,
          errorMessage: 'Failed to parse vals',
        ));
      }
    }
  }

  /// Handle charts topic messages
  void _handleChartsMessage(String message) {
    var splittedValue = message.split(',');
    splittedValue.removeLast();
    splittedValue = splittedValue.reversed.toList();
    AppLogger.instance.i('Received charts message: $splittedValue');
    emit(state.copyWith(
      status: DeviceStateStatus.data,
      deviceHistoryDatalist:
          splittedValue.map((e) => int.tryParse(e) ?? 0).toList(),
    ));
  }

  /// Handle schedule topic messages
  void _handleScheduleMessage(String message) {
    try {
      final Map<String, dynamic> data = jsonDecode(message);
      AppLogger.instance.i('Received schedule message: $data');
      final schedules = (data["schedule"] as List)
          .map((e) => ScheduleEntity.fromJsonWithId(e))
          .toList();
      emit(state.copyWith(
        status: DeviceStateStatus.data,
        schedules: schedules,
      ));
    } catch (e) {
      AppLogger.instance.e('Failed to parse schedule: $e');
      emit(state.copyWith(
        status: DeviceStateStatus.error,
        errorMessage: 'Failed to parse schedule',
      ));
    }
  }

  void subscribeToTopic(
    String topic, [
    MqttQos qosLevel = MqttQos.atLeastOnce,
  ]) {
    _mqttService.subscribe(topic, qosLevel);
    AppLogger.instance.i('Subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromAllTopics() async {
    emit(state.copyWith(status: DeviceStateStatus.loading));
    await _mqttService.unsubscribeFromAllTopics();
    emit(state.copyWith(status: DeviceStateStatus.data));
  }

  void publishToTopic(
    String topic,
    String message, {
    MqttQos qosLevel = MqttQos.atMostOnce,
  }) {
    if (!messageIsInJsonFormat(message)) {
      AppLogger.instance.e(
          'Message is not in JSON format: $message - not publishing to topic: $topic - StackTrace: ${StackTrace.current}');
      return;
    }
    _mqttService.publish(topic, message, qosLevel: qosLevel);
    if (topic.endsWith('vals')) {
      ValsPublisherLog.set(message);
    }
  }

  void createSchedule(ScheduleEntity schedule, String deviceId) {
    List<ScheduleEntity> currentSchedules = List.from(state.schedules);
    currentSchedules.add(schedule);
    publishSchedule(deviceId, currentSchedules);
    emit(
      state.copyWith(
        status: DeviceStateStatus.data,
        schedules: currentSchedules,
      ),
    );
  }

  void updateSchedule(ScheduleEntity updatedSchedule, String deviceId) {
    List<ScheduleEntity> currentSchedules = List.from(state.schedules);
    currentSchedules = currentSchedules.map((schedule) {
      if (schedule.id == updatedSchedule.id) {
        return updatedSchedule;
      }
      return schedule;
    }).toList();
    publishSchedule(deviceId, currentSchedules);
    emit(
      state.copyWith(
        status: DeviceStateStatus.data,
        schedules: currentSchedules,
      ),
    );
  }

  void deleteSchedule(String id, String deviceId) {
    List<ScheduleEntity> currentSchedules = List.from(state.schedules);
    currentSchedules.removeWhere((schedule) => schedule.id == id);
    publishSchedule(deviceId, currentSchedules);
    emit(
      state.copyWith(
        status: DeviceStateStatus.data,
        schedules: currentSchedules,
      ),
    );
  }

  void publishSchedule(String deviceId, List<ScheduleEntity> schedules) {
    _mqttService.setDeviceId(deviceId);
    _mqttService.publishToDeviceTopic(
      "schedule",
      jsonEncode({
        "schedule": schedules.map((e) => e.toJsonWithoutId()).toList(),
      }),
    );
  }

  bool messageIsInJsonFormat(String message) {
    try {
      jsonDecode(message);
      return true;
    } catch (e) {
      return false;
    }
  }

  void resetState() {
    emit(DeviceState.initial().copyWith(
      isConnected: _mqttService.isConnected,
    ));
  }

  @override
  Future<void> close() {
    // unsubscribeFromAllTopics();
    // Cancel all subscriptions
    for (var subscription in _topicSubscriptions) {
      subscription.cancel();
    }
    _topicSubscriptions.clear();
    return super.close();
  }
}
