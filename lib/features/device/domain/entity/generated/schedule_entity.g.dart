// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../schedule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleEntityImpl _$$ScheduleEntityImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleEntityImpl(
      day: json['day'] as String,
      duration: (json['duration'] as num).toInt(),
      time: json['time'] as String,
    );

Map<String, dynamic> _$$ScheduleEntityImplToJson(
        _$ScheduleEntityImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'duration': instance.duration,
      'time': instance.time,
    };
