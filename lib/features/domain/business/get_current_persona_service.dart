import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/repositories/persona_repository.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';

@injectable
class GetCurrentPersonaService implements UseCase<Persona, NoParams> {
  final PersonaRepository repository;
  final AuthorizationRepository authorizationRepository;

  GetCurrentPersonaService(this.repository, this.authorizationRepository);

  @override
  Future<Persona> call(NoParams noParams) async {
    final String login = await authorizationRepository.getCurrentLoggedInUser();
    return repository.getEntityByCodigo(login.toLowerCase());
  }
}
