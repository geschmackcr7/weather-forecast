import 'package:json_annotation/json_annotation.dart';

part 'main_entity.g.dart';

@JsonSerializable()
class MainEntity {
  @JsonKey(name: 'temp')
  final double? temp;

  @JsonKey(name: 'temp_min')
  final double? temp_min;

  @JsonKey(name: 'temp_max')
  final double? temp_max;

  @JsonKey(name: 'pressure')
  final int? pressure;

  @JsonKey(name: 'humidity')
  final int? humidity;

  @JsonKey(name: 'sea_level')
  final int? sea_level;

  @JsonKey(name: 'grnd_level')
  final int? grnd_level;

  MainEntity({
    this.temp,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
    this.sea_level,
    this.grnd_level,
  });

  factory MainEntity.fromJson(Map<String, dynamic> json) =>
      _$MainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MainEntityToJson(this);
}
