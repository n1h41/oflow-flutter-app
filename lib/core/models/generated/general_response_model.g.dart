// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../general_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralResponseModelImpl<T> _$$GeneralResponseModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$GeneralResponseModelImpl<T>(
      message: fromJsonT(json['message']),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$GeneralResponseModelImplToJson<T>(
  _$GeneralResponseModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': toJsonT(instance.message),
      'status': instance.status,
    };
