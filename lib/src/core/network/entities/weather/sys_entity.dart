import 'package:json_annotation/json_annotation.dart';

part 'sys_entity.g.dart';

@JsonSerializable()
class SysEntity {
  @JsonKey(name: 'type')
  final int? type;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'sunrise')
  final int? sunrise;

  @JsonKey(name: 'sunset')
  final int? sunset;

  SysEntity({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysEntity.fromJson(Map<String, dynamic> json) =>
      _$SysEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SysEntityToJson(this);
}
