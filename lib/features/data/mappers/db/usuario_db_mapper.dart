import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';

class UsuarioDBMapper {
  static UsuarioDBRegister mapEntityToDBRegister(Usuario entity) {
    if (entity == null) return null;
    final UsuarioDBRegister register = UsuarioDBRegister(
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
      authorities: setAuth(entity.authorities),
    );
    return register;
  }

  static Usuario mapDBRegisterToEntity(UsuarioDBRegister register) {
    if (register == null) return null;
    final Usuario entity = Usuario(
      id: register.id,
      login: register.login,
      firstName: register.firstName,
      lastName: register.lastName,
      email: register.email,
      imagenPath: register.imagenPath,
      activated: register.activated,
      langKey: register.langKey,
      createdBy: register.createdBy,
      createdDate: register.createdDate,
      lastModifiedBy: register.lastModifiedBy,
      lastModifiedDate: register.lastModifiedDate,
      authorities: getSetAuth(register.authorities),
    );
    return entity;
  }

  static List<Usuario> mapListDBRegisterToListEntity(List<UsuarioDBRegister> registers) {
    if (registers == null) return null;
    return registers.map(mapDBRegisterToEntity).toList();
  }

  static String setAuth(Set<String> setAuth) {
    String auth;
    if (setAuth != null) {
      auth = setAuth.join(',');
    }
    return auth;
  }

  static Set<String> getSetAuth(String auth) {
    final Set<String> setAuth = {};
    if (auth != null) {
      setAuth.addAll(auth.split(','));
    }
    return setAuth;
  }
}
