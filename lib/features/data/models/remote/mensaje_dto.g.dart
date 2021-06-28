// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensaje_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MensajeDto _$MensajeDtoFromJson(Map<String, dynamic> json) {
  return MensajeDto(
    id: json['id'] as int,
    remitente: json['remitente'] as String,
    destinatario: json['destinatario'] as String,
    fecha:
        json['fecha'] == null ? null : DateTime.parse(json['fecha'] as String),
    tipoContenido: json['tipoContenido'] as String,
    valor: json['valor'] as String,
    resumen: json['resumen'] as String,
    obraId: json['obraId'] as int,
  );
}

Map<String, dynamic> _$MensajeDtoToJson(MensajeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remitente': instance.remitente,
      'destinatario': instance.destinatario,
      'fecha': instance.fecha?.toIso8601String(),
      'tipoContenido': instance.tipoContenido,
      'valor': instance.valor,
      'resumen': instance.resumen,
      'obraId': instance.obraId,
    };
