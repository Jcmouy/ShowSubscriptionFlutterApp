import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';

part 'persona_dto.g.dart';

@JsonSerializable()
class PersonaDto extends Persona {
  const PersonaDto({
    int id,
    @required String codigo,
    @required String nombres,
    @required String apellidos,
    DateTime fechaNacimiento,
    @required String correoElectronico,
    String telefono,
    int cuentaId,
    int usuarioId,
    @required int paisId,
  }) : super(
            id: id,
            codigo: codigo,
            nombres: nombres,
            apellidos: apellidos,
            fechaNacimiento: fechaNacimiento,
            correoElectronico: correoElectronico,
            telefono: telefono,
            cuentaId: cuentaId,
            usuarioId: usuarioId,
            paisId: paisId);

  factory PersonaDto.fromJson(Map<String, dynamic> json) => _$PersonaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonaDtoToJson(this);

  factory PersonaDto.emptyPersona() {
    return PersonaDto(nombres: '', apellidos: '', codigo: '', paisId: 1, id: 0, fechaNacimiento: DateTime.now(), correoElectronico: '');
  }
}
