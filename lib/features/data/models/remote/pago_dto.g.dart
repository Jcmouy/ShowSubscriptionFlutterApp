// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pago_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagoDto _$PagoDtoFromJson(Map<String, dynamic> json) {
  return PagoDto(
    id: json['id'] as int,
    idExterno: json['idExterno'] as String,
    fechaExterna: json['fechaExterna'] == null
        ? null
        : DateTime.parse(json['fechaExterna'] as String),
  );
}

Map<String, dynamic> _$PagoDtoToJson(PagoDto instance) => <String, dynamic>{
      'id': instance.id,
      'idExterno': instance.idExterno,
      'fechaExterna': instance.fechaExterna?.toIso8601String(),
    };
