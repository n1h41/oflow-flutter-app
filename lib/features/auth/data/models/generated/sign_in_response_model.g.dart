// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseModelImpl _$$SignInResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignInResponseModelImpl(
      authenticationResult: json['AuthenticationResult'] == null
          ? null
          : AuthenticationResult.fromJson(
              json['AuthenticationResult'] as Map<String, dynamic>),
      challengeName: json['ChallengeName'] as String?,
      challengeParameters: json['ChallengeParameters'] == null
          ? null
          : ChallengeParameters.fromJson(
              json['ChallengeParameters'] as Map<String, dynamic>),
      session: json['Session'],
      resultMetadata: json['ResultMetadata'] == null
          ? null
          : ChallengeParameters.fromJson(
              json['ResultMetadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignInResponseModelImplToJson(
        _$SignInResponseModelImpl instance) =>
    <String, dynamic>{
      'AuthenticationResult': instance.authenticationResult?.toJson(),
      'ChallengeName': instance.challengeName,
      'ChallengeParameters': instance.challengeParameters?.toJson(),
      'Session': instance.session,
      'ResultMetadata': instance.resultMetadata?.toJson(),
    };

_$AuthenticationResultImpl _$$AuthenticationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationResultImpl(
      accessToken: json['AccessToken'] as String?,
      expiresIn: (json['ExpiresIn'] as num?)?.toInt(),
      idToken: json['IdToken'] as String?,
      newDeviceMetadata: json['NewDeviceMetadata'],
      refreshToken: json['RefreshToken'] as String?,
      tokenType: json['TokenType'] as String?,
    );

Map<String, dynamic> _$$AuthenticationResultImplToJson(
        _$AuthenticationResultImpl instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'ExpiresIn': instance.expiresIn,
      'IdToken': instance.idToken,
      'NewDeviceMetadata': instance.newDeviceMetadata,
      'RefreshToken': instance.refreshToken,
      'TokenType': instance.tokenType,
    };

_$ChallengeParametersImpl _$$ChallengeParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeParametersImpl();

Map<String, dynamic> _$$ChallengeParametersImplToJson(
        _$ChallengeParametersImpl instance) =>
    <String, dynamic>{};
