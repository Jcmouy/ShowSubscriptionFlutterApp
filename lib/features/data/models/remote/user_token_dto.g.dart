// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenDto _$UserTokenDtoFromJson(Map<String, dynamic> json) {
  return UserTokenDto(
    idToken: json['id_token'] as String,
  );
}

Map<String, dynamic> _$UserTokenDtoToJson(UserTokenDto instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
    };
