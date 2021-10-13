// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      avatar: json['avatar'] as String?,
      createdAt: json['created_at'] as String?,
      fullName: json['full_name'] as String?,
      id: json['id'] as String?,
      refreshToken: json['refresh_token'] as String?,
      sex: json['sex'] as int?,
      stores: json['stores'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : ThumbnailsEntity.fromJson(
              json['thumbnails'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
      'full_name': instance.fullName,
      'id': instance.id,
      'refresh_token': instance.refreshToken,
      'sex': instance.sex,
      'stores': instance.stores,
      'thumbnails': instance.thumbnails,
      'token': instance.token,
    };
