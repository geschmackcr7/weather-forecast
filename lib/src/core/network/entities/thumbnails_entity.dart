
import 'package:json_annotation/json_annotation.dart';

part 'thumbnails_entity.g.dart';

// done this file

@JsonSerializable()
class ThumbnailsEntity {

  @JsonKey(name: '20x20')
  final String? twoTwo;

  @JsonKey(name: '50x50')
  final String? fiveFive;

  ThumbnailsEntity({
    this.twoTwo,
    this.fiveFive,
  });

  factory ThumbnailsEntity.fromJson(Map<String, dynamic> json) => 
    _$ThumbnailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsEntityToJson(this);
}
