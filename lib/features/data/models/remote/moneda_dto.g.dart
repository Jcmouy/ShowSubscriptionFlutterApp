// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moneda_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonedaDto _$MonedaDtoFromJson(Map<String, dynamic> json) {
  return MonedaDto(
    id: json['id'] as int,
    codigo: json['codigo'] as String,
    nombre: json['nombre'] as String,
  );
}

Map<String, dynamic> _$MonedaDtoToJson(MonedaDto instance) => <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nombre': instance.nombre,
    };
