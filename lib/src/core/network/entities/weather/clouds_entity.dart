import 'package:json_annotation/json_annotation.dart';

part 'clouds_entity.g.dart';

@JsonSerializable()
class CloudsEntity {
  @JsonKey(name: 'all')
  final int? all;

  CloudsEntity({
    this.all,
  });

  factory CloudsEntity.fromJson(Map<String, dynamic> json) =>
      _$CloudsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsEntityToJson(this);
}
