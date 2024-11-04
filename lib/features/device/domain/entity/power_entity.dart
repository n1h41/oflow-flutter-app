import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/power_entity.freezed.dart';
part 'generated/power_entity.g.dart';

@freezed
class PowerEntity with _$PowerEntity {
  const factory PowerEntity({
    required String p,
    required String o,
  }) = _PowerEntity;

  factory PowerEntity.fromJson(Map<String, dynamic> json) =>
      _$PowerEntityFromJson(json);
}
