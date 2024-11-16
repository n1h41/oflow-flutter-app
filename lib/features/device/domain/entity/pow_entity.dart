import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pow_entity.freezed.dart';
part 'generated/pow_entity.g.dart';

@freezed
class PowEntity with _$PowEntity {
  const factory PowEntity({
    required int v,
    required int a,
  }) = _PowEntity;

  factory PowEntity.fromJson(Map<String, dynamic> json) =>
      _$PowEntityFromJson(json);
}
