import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/vals_entity.freezed.dart';
part 'generated/vals_entity.g.dart';

@freezed
class ValsEntity with _$ValsEntity {
  const factory ValsEntity({
    @JsonKey(name: 'off_time') required String offTime,
    @JsonKey(name: 'min_volt') required String minVolt,
    @JsonKey(name: 'min_current') required String minCurrent,
    @JsonKey(name: 'max_current') required String maxCurrent,
  }) = _ValsEntity;

  factory ValsEntity.fromJson(Map<String, dynamic> json) =>
      _$ValsEntityFromJson(json);
}
