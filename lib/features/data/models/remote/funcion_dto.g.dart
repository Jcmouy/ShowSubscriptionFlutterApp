// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncionDto _$FuncionDtoFromJson(Map<String, dynamic> json) {
  return FuncionDto(
    id: json['id'] as int,
    fecha:
        json['fecha'] == null ? null : DateTime.parse(json['fecha'] as String),
    precio: (json['precio'] as num)?.toDouble(),
    monedaId: json['monedaId'] as int,
    paisId: json['paisId'] as int,
    obraId: json['obraId'] as int,
  );
}

Map<String, dynamic> _$FuncionDtoToJson(FuncionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fecha': instance.fecha?.toIso8601String(),
      'precio': instance.precio,
      'monedaId': instance.monedaId,
      'paisId': instance.paisId,
      'obraId': instance.obraId,
    };
