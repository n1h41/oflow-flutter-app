// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../vals_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValsEntityImpl _$$ValsEntityImplFromJson(Map<String, dynamic> json) =>
    _$ValsEntityImpl(
      offTime: json['off_time'] as String,
      minVolt: json['min_volt'] as String,
      minCurrent: json['min_current'] as String,
      maxCurrent: json['max_current'] as String,
    );

Map<String, dynamic> _$$ValsEntityImplToJson(_$ValsEntityImpl instance) =>
    <String, dynamic>{
      'off_time': instance.offTime,
      'min_volt': instance.minVolt,
      'min_current': instance.minCurrent,
      'max_current': instance.maxCurrent,
    };
