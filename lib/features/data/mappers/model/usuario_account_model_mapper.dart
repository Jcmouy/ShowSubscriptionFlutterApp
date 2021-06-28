import 'package:plataforma_app/features/data/models/remote/usuario_account_dto.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';

class UsuarioAccountDtoMapper {
  static UsuarioAccountDto mapEntityToDto(Usuario entity) {
    final UsuarioAccountDto dto = UsuarioAccountDto(
        id: entity.id,
        login: entity.login,
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        imageUrl: entity.imagenPath,
        password: entity.password,
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
