import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oflow/core/constants/exceptions/failure.dart';
import 'package:oflow/features/device/domain/entity/device_entity.dart';

part 'generated/home_state.freezed.dart';

enum HomeStateStatus { initial, loading, error, data }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required HomeStateStatus status,
    Failure? error,
    @Default([]) List<DeviceEntity> deviceList,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStateStatus.initial,
    );
  }

  factory HomeState.loading() {
    return const HomeState(
      status: HomeStateStatus.loading,
    );
  }

  factory HomeState.error(Failure? error) {
    return HomeState(
      status: HomeStateStatus.error,
      error: error,
    );
  }
}
