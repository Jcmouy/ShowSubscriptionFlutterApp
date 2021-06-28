// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCredentialsDto _$UserCredentialsDtoFromJson(Map<String, dynamic> json) {
  return UserCredentialsDto(
    password: json['password'] as String,
    username: json['username'] as String,
    rememberMe: json['rememberMe'] as bool,
  );
}

Map<String, dynamic> _$UserCredentialsDtoToJson(UserCredentialsDto instance) =>
    <String, dynamic>{
      'password': instance.password,
      'rememberMe': instance.rememberMe,
      'username': instance.username,
    };
