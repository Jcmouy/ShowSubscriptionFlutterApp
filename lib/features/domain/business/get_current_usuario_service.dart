import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/domain/repositories/usuario_repository.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';

@injectable
class GetCurrentUsuarioService implements UseCase<Usuario, NoParams> {
  final UsuarioRepository repository;
  final AuthorizationRepository authorizationRepository;

  GetCurrentUsuarioService(this.repository, this.authorizationRepository);

  @override
  Future<Usuario> call(NoParams noParams) async {
    final String login = await authorizationRepository.getCurrentLoggedInUser();
    return repository.getEntityByLogin(login);
  }
}
