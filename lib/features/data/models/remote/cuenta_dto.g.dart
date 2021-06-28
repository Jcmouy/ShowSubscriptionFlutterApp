// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuenta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuentaDto _$CuentaDtoFromJson(Map<String, dynamic> json) {
  return CuentaDto(
    id: json['id'] as int,
    codigo: json['codigo'] as String,
    nombre: json['nombre'] as String,
    fechaBaja: json['fechaBaja'] == null
        ? null
        : DateTime.parse(json['fechaBaja'] as String),
  );
}

Map<String, dynamic> _$CuentaDtoToJson(CuentaDto instance) => <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'fechaBaja': instance.fechaBaja?.toIso8601String(),
    };
