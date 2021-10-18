import 'package:json_annotation/json_annotation.dart';

part 'wind_entity.g.dart';

@JsonSerializable()
class WindEntity {
  @JsonKey(name: 'speed')
  final double? speed;

  @JsonKey(name: 'deg')
  final double? deg;

  @JsonKey(name: 'gust')
  final double? gust;

  WindEntity({
    this.speed,
    this.deg,
    this.gust,
  });

  factory WindEntity.fromJson(Map<String, dynamic> json) =>
      _$WindEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WindEntityToJson(this);
}
