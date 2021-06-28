// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioAccountDto _$UsuarioAccountDtoFromJson(Map<String, dynamic> json) {
  return UsuarioAccountDto(
    id: json['id'] as int,
    login: json['login'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    imageUrl: json['imageUrl'] as String,
    activated: json['activated'] as bool,
    langKey: json['langKey'] as String,
    createdBy: json['createdBy'] as String,
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    lastModifiedBy: json['lastModifiedBy'] as String,
    lastModifiedDate: json['lastModifiedDate'] == null
        ? null
        : DateTime.parse(json['lastModifiedDate'] as String),
    password: json['password'] as String,
    authorities:
        (json['authorities'] as List)?.map((e) => e as String)?.toSet(),
  );
}

Map<String, dynamic> _$UsuarioAccountDtoToJson(UsuarioAccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'activated': instance.activated,
      'langKey': instance.langKey,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'password': instance.password,
      'authorities': instance.authorities?.toList(),
    };
