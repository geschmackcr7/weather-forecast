// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysEntity _$SysEntityFromJson(Map<String, dynamic> json) => SysEntity(
      type: json['type'] as int?,
      id: json['id'] as int?,
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );

Map<String, dynamic> _$SysEntityToJson(SysEntity instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
