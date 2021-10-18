import 'package:json_annotation/json_annotation.dart';
import 'package:weather_forecast/src/core/network/entities/login/thumbnails_entity.dart';

part 'login_response.g.dart';

// done this file

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @JsonKey(name: 'sex')
  final int? sex;

  @JsonKey(name: 'stores')
  final String? stores;

  @JsonKey(name: 'thumbnails')
  final ThumbnailsEntity? thumbnails;

  @JsonKey(name: 'token')
  final String? token;

  LoginResponse({
    this.avatar,
    this.createdAt,
    this.fullName,
    this.id,
    this.refreshToken,
    this.sex,
    this.stores,
    this.thumbnails,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
