// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_account_change_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioAccountChangePasswordDto _$UsuarioAccountChangePasswordDtoFromJson(
    Map<String, dynamic> json) {
  return UsuarioAccountChangePasswordDto(
    currentPassword: json['currentPassword'] as String,
    newPassword: json['newPassword'] as String,
  );
}

Map<String, dynamic> _$UsuarioAccountChangePasswordDtoToJson(
        UsuarioAccountChangePasswordDto instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
