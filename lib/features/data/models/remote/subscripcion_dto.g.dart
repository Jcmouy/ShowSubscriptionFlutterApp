// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscripcion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscripcionDto _$SubscripcionDtoFromJson(Map<String, dynamic> json) {
  return SubscripcionDto(
    id: json['id'] as int,
    fecha:
        json['fecha'] == null ? null : DateTime.parse(json['fecha'] as String),
    metodoPago:
        _$enumDecodeNullable(_$EnumMetodoPagoEnumMap, json['metodoPago']),
    funcionId: json['funcionId'] as int,
    pagoId: json['pagoId'] as int,
    personaId: json['personaId'] as int,
  );
}

Map<String, dynamic> _$SubscripcionDtoToJson(SubscripcionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fecha': instance.fecha?.toIso8601String(),
      'metodoPago': _$EnumMetodoPagoEnumMap[instance.metodoPago],
      'funcionId': instance.funcionId,
      'pagoId': instance.pagoId,
      'personaId': instance.personaId,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$EnumMetodoPagoEnumMap = {
  EnumMetodoPago.TICKETERA: 'TICKETERA',
  EnumMetodoPago.APPLEPAY: 'APPLEPAY',
  EnumMetodoPago.GOOGLEPAY: 'GOOGLEPAY',
};
