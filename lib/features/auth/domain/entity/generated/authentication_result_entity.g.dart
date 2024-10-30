// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../authentication_result_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationResultEntityImpl _$$AuthenticationResultEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationResultEntityImpl(
      accessToken: json['AccessToken'] as String?,
      expiresIn: (json['ExpiresIn'] as num?)?.toInt(),
      idToken: json['IdToken'] as String?,
      newDeviceMetadata: json['NewDeviceMetadata'],
      refreshToken: json['RefreshToken'] as String?,
      tokenType: json['TokenType'] as String?,
    );

Map<String, dynamic> _$$AuthenticationResultEntityImplToJson(
        _$AuthenticationResultEntityImpl instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'ExpiresIn': instance.expiresIn,
      'IdToken': instance.idToken,
      'NewDeviceMetadata': instance.newDeviceMetadata,
      'RefreshToken': instance.refreshToken,
      'TokenType': instance.tokenType,
    };
