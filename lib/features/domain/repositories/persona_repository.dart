import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/shared/domain/generic_crud_entity_repository.dart';

abstract class PersonaRepository extends GenericCrudEntityRepository<Persona> {
  Future<Persona> getEntityByCodigo(String codigo);
}
