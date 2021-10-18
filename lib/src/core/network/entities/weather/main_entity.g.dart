// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainEntity _$MainEntityFromJson(Map<String, dynamic> json) => MainEntity(
      temp: (json['temp'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      sea_level: json['sea_level'] as int?,
      grnd_level: json['grnd_level'] as int?,
    );

Map<String, dynamic> _$MainEntityToJson(MainEntity instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.sea_level,
      'grnd_level': instance.grnd_level,
    };
