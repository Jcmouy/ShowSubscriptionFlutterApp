import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/domain/entities/password_usuario.dart';
import 'package:plataforma_app/shared/domain/generic_crud_entity_repository.dart';

abstract class UsuarioRepository extends GenericCrudEntityRepository<Usuario> {
  Future<void> registerUserAccount(Usuario usuarioDto);

  Future<bool> changeUserAccountPassword(PasswordUsuario passwordUsuario);

  Future<Usuario> getEntityByLogin(String login);
}
