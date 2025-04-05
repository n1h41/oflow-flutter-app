import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oflow/core/constants/enums.dart';

part 'generated/device_entity.freezed.dart';
part 'generated/device_entity.g.dart';

@freezed
class DeviceEntity with _$DeviceEntity {
  const factory DeviceEntity({
    required String id,
    required String name,
    required String macAddress,
    required DeviceType type,
  }) = _DeviceEntity;

  factory DeviceEntity.fromJson(Map<String, dynamic> json) =>
      _$DeviceEntityFromJson(json);
}
