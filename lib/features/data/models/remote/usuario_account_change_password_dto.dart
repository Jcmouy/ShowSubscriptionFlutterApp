import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'usuario_account_change_password_dto.g.dart';

@JsonSerializable()
class UsuarioAccountChangePasswordDto {
  String currentPassword;
  String newPassword;

  UsuarioAccountChangePasswordDto({
    @required this.currentPassword,
    @required this.newPassword,
  });

  factory UsuarioAccountChangePasswordDto.fromJson(Map<String, dynamic> json) => _$UsuarioAccountChangePasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioAccountChangePasswordDtoToJson(this);
}
