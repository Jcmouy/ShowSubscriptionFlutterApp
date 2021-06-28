// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etiqueta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtiquetaDto _$EtiquetaDtoFromJson(Map<String, dynamic> json) {
  return EtiquetaDto(
    id: json['id'] as int,
    nombre: json['nombre'] as String,
  );
}

Map<String, dynamic> _$EtiquetaDtoToJson(EtiquetaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
    };
