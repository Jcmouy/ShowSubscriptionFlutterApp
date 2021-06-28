import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';

class PersonaDBMapper {
  static PersonaDBRegister mapEntityToDBRegister(Persona entity) {
    if (entity == null) return null;
    final PersonaDBRegister register = PersonaDBRegister(
        id: entity.id,
        codigo: entity.codigo,
        nombres: entity.nombres,
        apellidos: entity.apellidos,
        fechaNacimiento: entity.fechaNacimiento,
        correoElectronico: entity.correoElectronico,
        telefono: entity.telefono,
        cuentaId: entity.cuentaId,
        usuarioId: entity.usuarioId,
        paisId: entity.paisId);
    return register;
  }

  static Persona mapDBRegisterToEntity(PersonaDBRegister register) {
    if (register == null) return null;
    final Persona entity = Persona(
        id: register.id,
        codigo: register.codigo,
        nombres: register.nombres,
        apellidos: register.apellidos,
        fechaNacimiento: register.fechaNacimiento,
        correoElectronico: register.correoElectronico,
        telefono: register.telefono,
        cuentaId: register.cuentaId,
        usuarioId: register.usuarioId,
        paisId: register.paisId);
    return entity;
  }

  static List<Persona> mapListDBRegisterToListEntity(List<PersonaDBRegister> registers) {
    if (registers == null) return null;
    return registers.map(mapDBRegisterToEntity).toList();
  }
}
