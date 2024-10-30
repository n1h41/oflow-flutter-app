import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/general_response_model.freezed.dart';
part 'generated/general_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class GeneralResponseModel<T> with _$GeneralResponseModel {
  const factory GeneralResponseModel({
    required T message,
    required bool status,
  }) = _GeneralResponseModel;

  factory GeneralResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GeneralResponseModelFromJson(json, fromJsonT);
}
