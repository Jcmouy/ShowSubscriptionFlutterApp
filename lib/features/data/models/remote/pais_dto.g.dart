// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pais_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaisDto _$PaisDtoFromJson(Map<String, dynamic> json) {
  return PaisDto(
    id: json['id'] as int,
    codigo: json['codigo'] as String,
    nombre: json['nombre'] as String,
  );
}

Map<String, dynamic> _$PaisDtoToJson(PaisDto instance) => <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nombre': instance.nombre,
    };
