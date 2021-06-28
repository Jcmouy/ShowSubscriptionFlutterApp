import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/repositories/persona_repository.dart';

@injectable
class CreatePersonaService implements UseCase<Persona, Persona> {
  final PersonaRepository repository;

  CreatePersonaService(this.repository);

  @override
  Future<Persona> call(Persona params) async {
    return repository.createEntity(params);
  }
}
