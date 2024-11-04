import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/device_status_entity.freezed.dart';
part 'generated/device_status_entity.g.dart';

@freezed
class DeviceStatusEntity with _$DeviceStatusEntity {
  const factory DeviceStatusEntity({
    required String p,
    required String o,
  }) = _DeviceStatusEntity;

  factory DeviceStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$DeviceStatusEntityFromJson(json);
}
