import 'package:plataforma_app/features/data/models/remote/persona_dto.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';

class PersonaDtoMapper {
  static PersonaDto mapEntityToDto(Persona entity) {
    final PersonaDto model = PersonaDto(
        id: entity.id,
        codigo: entity.codigo,
        nombres: entity.nombres,
        apellidos: entity.apellidos,
        fechaNacimiento: entity.fechaNacimiento,
        correoElectronico: entity.correoElectronico,
        telefono: entity.telefono,
        cuentaId: entity.cuentaId,
        paisId: entity.paisId);
    return model;
  }

  static Persona mapDtoToEntity(PersonaDto model) {
    final Persona entity = Persona(
        id: model.id,
        codigo: model.codigo,
        nombres: model.nombres,
        apellidos: model.apellidos,
        fechaNacimiento: model.fechaNacimiento,
        correoElectronico: model.correoElectronico,
        telefono: model.telefono,
        cuentaId: model.cuentaId,
        paisId: model.paisId);
    return entity;
  }
}
