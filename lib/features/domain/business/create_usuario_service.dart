import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/social_usuario.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/features/domain/repositories/usuario_repository.dart';

@injectable
class CreateUsuarioService implements UseCase<Usuario, SocialUsuario> {
  final UsuarioRepository repository;
  final AuthorizationRepository authorizationRepository;

  CreateUsuarioService(this.repository, this.authorizationRepository);

  @override
  Future<Usuario> call(SocialUsuario usuario) async {
    try {
      //Registro el usuario
      await Future.wait([registerUserAccount(usuario), clearAuthorizationToken()]);
      await getAuthorizationTokenOf(usuario);
      //Obtengo el usuario creado para tener el id
      final Usuario usuarioResponse = await repository.getEntityByLogin(usuario.login);
      return usuarioResponse;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> registerUserAccount(Usuario usuario) async {
    return repository.registerUserAccount(usuario);
  }

  Future<void> clearAuthorizationToken() async {
    return authorizationRepository.clearAuthorizationToken();
  }

  Future<String> getAuthorizationTokenOf(SocialUsuario usuario) async {
    String password = usuario.password;
    if (usuario.socialToken != null && usuario.socialToken.isNotEmpty) {
      password = usuario.socialToken;
    }
    return authorizationRepository.getAuthorizationTokenOf(usuario.login, password);
  }
}
