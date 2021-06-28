import 'package:plataforma_app/features/data/models/remote/usuario_dto.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';

class UsuarioDtoMapper {
  static UsuarioDto mapEntityToDto(Usuario entity) {
    final UsuarioDto dto = UsuarioDto(
        id: entity.id,
        login: entity.login,
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        imagenPath: entity.imagenPath,
        activated: entity.activated,
        langKey: entity.langKey,
        createdBy: entity.createdBy,
        createdDate: entity.createdDate,
        lastModifiedBy: entity.lastModifiedBy,
        lastModifiedDate: entity.lastModifiedDate,
        authorities: entity.authorities);

    return dto;
  }
}
