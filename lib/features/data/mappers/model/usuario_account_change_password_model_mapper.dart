import 'package:plataforma_app/features/data/models/remote/usuario_account_change_password_dto.dart';
import 'package:plataforma_app/features/domain/entities/password_usuario.dart';

class UsuarioAccountChangePasswordDtoMapper {
  static UsuarioAccountChangePasswordDto mapEntityToDto(PasswordUsuario entity) {
    final UsuarioAccountChangePasswordDto dto = UsuarioAccountChangePasswordDto(
      currentPassword: entity.currentPassword,
      newPassword: entity.newPassword,
    );

    return dto;
  }
}
