import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/authentication_result_entity.freezed.dart';
part 'generated/authentication_result_entity.g.dart';

@freezed
class AuthenticationResultEntity with _$AuthenticationResultEntity {
  const factory AuthenticationResultEntity({
    @JsonKey(name: "AccessToken") String? accessToken,
    @JsonKey(name: "ExpiresIn") int? expiresIn,
    @JsonKey(name: "IdToken") String? idToken,
    @JsonKey(name: "NewDeviceMetadata") dynamic newDeviceMetadata,
    @JsonKey(name: "RefreshToken") String? refreshToken,
    @JsonKey(name: "TokenType") String? tokenType,
  }) = _AuthenticationResultEntity;

  factory AuthenticationResultEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResultEntityFromJson(json);
}
