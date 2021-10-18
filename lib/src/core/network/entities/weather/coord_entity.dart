import 'package:json_annotation/json_annotation.dart';

part 'coord_entity.g.dart';

@JsonSerializable()
class CoordEntity {
  @JsonKey(name: 'lon')
  final double? lon;

  @JsonKey(name: 'lat')
  final double? lat;

  CoordEntity({
    this.lon,
    this.lat,
  });

  factory CoordEntity.fromJson(Map<String, dynamic> json) =>
      _$CoordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CoordEntityToJson(this);
}
