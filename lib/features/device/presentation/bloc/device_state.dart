import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/device_state.freezed.dart';

enum DeviceStateStatus { initial, loading, error, data }

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState({
    required DeviceStateStatus status,
    String? errorMessage,
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
