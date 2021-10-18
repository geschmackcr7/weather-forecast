import 'package:json_annotation/json_annotation.dart';

part 'rain_entity.g.dart';

@JsonSerializable()
class RainEntity {
  @JsonKey(name: '1h')
  final double? on1h;
  RainEntity({
    this.on1h,
  });

  factory RainEntity.fromJson(Map<String, dynamic> json) =>
      _$RainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RainEntityToJson(this);
}
