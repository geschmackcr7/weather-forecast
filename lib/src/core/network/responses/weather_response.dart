import 'package:json_annotation/json_annotation.dart';

import 'package:weather_forecast/src/core/network/entities/weather/clouds_entity.dart';
import 'package:weather_forecast/src/core/network/entities/weather/coord_entity.dart';
import 'package:weather_forecast/src/core/network/entities/weather/main_entity.dart';
import 'package:weather_forecast/src/core/network/entities/weather/rain_entity.dart';
import 'package:weather_forecast/src/core/network/entities/weather/sys_entity.dart';
import 'package:weather_forecast/src/core/network/entities/weather/weather_entity.dart';
import 'package:weather_forecast/src/core/network/entities/weather/wind_entity.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  @JsonKey(name: 'coord')
  final CoordEntity? coord;

  @JsonKey(name: 'weather')
  final List<WeatherEntity>? weather;

  @JsonKey(name: 'base')
  final String? base;

  @JsonKey(name: 'main')
  final MainEntity? main;

  @JsonKey(name: 'visibility')
  final int? visibility;

  @JsonKey(name: 'wind')
  final WindEntity? wind;

  @JsonKey(name: 'rain')
  final RainEntity? rain;

  @JsonKey(name: 'clouds')
  final CloudsEntity? clouds;

  @JsonKey(name: 'dt')
  final int? dt;

  @JsonKey(name: 'sys')
  final SysEntity? sys;

  @JsonKey(name: 'timezone')
  final int? timezone;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'cod')
  final int? cod;

  WeatherResponse({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
