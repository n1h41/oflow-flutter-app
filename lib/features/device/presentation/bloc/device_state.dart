import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mqtt5_client/mqtt5_client.dart';

import '../../../../core/constants/exceptions/failure.dart';
import '../../domain/entity/device_status_entity.dart';
import '../../domain/entity/pow_entity.dart';
import '../../domain/entity/vals_entity.dart';

part 'generated/device_state.freezed.dart';

enum DeviceStateStatus { initial, loading, error, data }

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState({
    required DeviceStateStatus status,
    String? errorMessage,
    Failure? error,
    @Default([]) List<int> deviceHistoryDatalist,
    DeviceStatusEntity? deviceStatus,
    PowEntity? devicePowerDetails,
    ValsEntity? deviceValueDetails,
    String? deviceMac,
    @Default([]) List<MqttSubscription> subscriptions,
  }) = _DeviceState;

  factory DeviceState.initial() {
    return const DeviceState(
      status: DeviceStateStatus.initial,
    );
  }

  factory DeviceState.loading() {
    return const DeviceState(
      status: DeviceStateStatus.loading,
    );
  }

  factory DeviceState.error(String? errorMessage) {
    return DeviceState(
      status: DeviceStateStatus.error,
      errorMessage: errorMessage ?? 'An error occurred',
    );
  }
}
