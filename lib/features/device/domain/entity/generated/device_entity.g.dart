// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../device_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceEntityImpl _$$DeviceEntityImplFromJson(Map<String, dynamic> json) =>
    _$DeviceEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      macAddress: json['mac_address'] as String,
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$DeviceEntityImplToJson(_$DeviceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mac_address': instance.macAddress,
      'type': _$DeviceTypeEnumMap[instance.type]!,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.pump: 'pump',
};
