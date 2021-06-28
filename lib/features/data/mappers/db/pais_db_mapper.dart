import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';

class PaisDBMapper {
  static PaisDBRegister mapEntityToDBRegister(Pais entity) {
    if (entity == null) return null;
    final PaisDBRegister register = PaisDBRegister(
      id: entity.id,
      codigo: entity.codigo,
      nombre: entity.nombre,
    );
    return register;
  }

  static Pais mapDBRegisterToEntity(PaisDBRegister register) {
    if (register == null) return null;
    final Pais entity = Pais(
      id: register.id,
      codigo: register.codigo,
      nombre: register.nombre,
    );
    return entity;
  }

  static List<Pais> mapListDBRegisterToListEntity(List<PaisDBRegister> registers) {
    if (registers == null) return null;
    return registers.map(mapDBRegisterToEntity).toList();
  }
}
