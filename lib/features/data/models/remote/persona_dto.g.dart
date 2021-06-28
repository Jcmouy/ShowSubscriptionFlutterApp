// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonaDto _$PersonaDtoFromJson(Map<String, dynamic> json) {
  return PersonaDto(
    id: json['id'] as int,
    codigo: json['codigo'] as String,
    nombres: json['nombres'] as String,
    apellidos: json['apellidos'] as String,
    fechaNacimiento: json['fechaNacimiento'] == null
        ? null
        : DateTime.parse(json['fechaNacimiento'] as String),
    correoElectronico: json['correoElectronico'] as String,
    telefono: json['telefono'] as String,
    cuentaId: json['cuentaId'] as int,
    usuarioId: json['usuarioId'] as int,
    paisId: json['paisId'] as int,
  );
}

Map<String, dynamic> _$PersonaDtoToJson(PersonaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'fechaNacimiento': instance.fechaNacimiento?.toIso8601String(),
      'correoElectronico': instance.correoElectronico,
      'telefono': instance.telefono,
      'cuentaId': instance.cuentaId,
      'usuarioId': instance.usuarioId,
      'paisId': instance.paisId,
    };
