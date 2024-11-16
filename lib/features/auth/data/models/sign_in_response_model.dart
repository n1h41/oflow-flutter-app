import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/sign_in_response_model.freezed.dart';
part 'generated/sign_in_response_model.g.dart';

@freezed
class SignInResponseModel with _$SignInResponseModel {
  const factory SignInResponseModel({
    @JsonKey(name: "AuthenticationResult")
    AuthenticationResult? authenticationResult,
    @JsonKey(name: "ChallengeName") String? challengeName,
    @JsonKey(name: "ChallengeParameters")
    ChallengeParameters? challengeParameters,
    @JsonKey(name: "Session") dynamic session,
    @JsonKey(name: "ResultMetadata") ChallengeParameters? resultMetadata,
  }) = _SignInResponseModel;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
}

@freezed
class AuthenticationResult with _$AuthenticationResult {
  const factory AuthenticationResult({
    @JsonKey(name: "AccessToken") String? accessToken,
    @JsonKey(name: "ExpiresIn") int? expiresIn,
    @JsonKey(name: "IdToken") String? idToken,
    @JsonKey(name: "NewDeviceMetadata") dynamic newDeviceMetadata,
    @JsonKey(name: "RefreshToken") String? refreshToken,
    @JsonKey(name: "TokenType") String? tokenType,
  }) = _AuthenticationResult;

  factory AuthenticationResult.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResultFromJson(json);
}

@freezed
class ChallengeParameters with _$ChallengeParameters {
  const factory ChallengeParameters() = _ChallengeParameters;

  factory ChallengeParameters.fromJson(Map<String, dynamic> json) =>
      _$ChallengeParametersFromJson(json);
}
