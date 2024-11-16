// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_identity_credentials_resp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetIdentityCredentialsRespModelImpl
    _$$GetIdentityCredentialsRespModelImplFromJson(Map<String, dynamic> json) =>
        _$GetIdentityCredentialsRespModelImpl(
          credentials: json['Credentials'] == null
              ? null
              : Credentials.fromJson(
                  json['Credentials'] as Map<String, dynamic>),
          identityId: json['IdentityId'] as String?,
          resultMetadata: json['ResultMetadata'] == null
              ? null
              : ResultMetadata.fromJson(
                  json['ResultMetadata'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$GetIdentityCredentialsRespModelImplToJson(
        _$GetIdentityCredentialsRespModelImpl instance) =>
    <String, dynamic>{
      'Credentials': instance.credentials?.toJson(),
      'IdentityId': instance.identityId,
      'ResultMetadata': instance.resultMetadata?.toJson(),
    };

_$CredentialsImpl _$$CredentialsImplFromJson(Map<String, dynamic> json) =>
    _$CredentialsImpl(
      accessKeyId: json['AccessKeyId'] as String?,
      expiration: json['Expiration'] as String?,
      secretKey: json['SecretKey'] as String?,
      sessionToken: json['SessionToken'] as String?,
    );

Map<String, dynamic> _$$CredentialsImplToJson(_$CredentialsImpl instance) =>
    <String, dynamic>{
      'AccessKeyId': instance.accessKeyId,
      'Expiration': instance.expiration,
      'SecretKey': instance.secretKey,
      'SessionToken': instance.sessionToken,
    };

_$ResultMetadataImpl _$$ResultMetadataImplFromJson(Map<String, dynamic> json) =>
    _$ResultMetadataImpl();

Map<String, dynamic> _$$ResultMetadataImplToJson(
        _$ResultMetadataImpl instance) =>
    <String, dynamic>{};
