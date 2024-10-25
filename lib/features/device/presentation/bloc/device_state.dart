import 'package:equatable/equatable.dart';

enum DeviceStateStatus { initial, loading, error }

class DeviceState extends Equatable {
  final DeviceStateStatus status;

  const DeviceState({
    this.status = DeviceStateStatus.initial,
  });

  @override
  List<Object?> get props => [status];
}
