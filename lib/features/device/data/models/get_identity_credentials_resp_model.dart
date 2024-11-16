import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_identity_credentials_resp_model.freezed.dart';
part 'generated/get_identity_credentials_resp_model.g.dart';

@freezed
class GetIdentityCredentialsRespModel with _$GetIdentityCredentialsRespModel {
  const factory GetIdentityCredentialsRespModel({
    @JsonKey(name: "Credentials") Credentials? credentials,
    @JsonKey(name: "IdentityId") String? identityId,
    @JsonKey(name: "ResultMetadata") ResultMetadata? resultMetadata,
  }) = _GetIdentityCredentialsRespModel;

  factory GetIdentityCredentialsRespModel.fromJson(Map<String, dynamic> json) =>
      _$GetIdentityCredentialsRespModelFromJson(json);
}

@freezed
class Credentials with _$Credentials {
  const factory Credentials({
    @JsonKey(name: "AccessKeyId") String? accessKeyId,
    @JsonKey(name: "Expiration") String? expiration,
    @JsonKey(name: "SecretKey") String? secretKey,
    @JsonKey(name: "SessionToken") String? sessionToken,
  }) = _Credentials;

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}

@freezed
class ResultMetadata with _$ResultMetadata {
  const factory ResultMetadata() = _ResultMetadata;

  factory ResultMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResultMetadataFromJson(json);
}
