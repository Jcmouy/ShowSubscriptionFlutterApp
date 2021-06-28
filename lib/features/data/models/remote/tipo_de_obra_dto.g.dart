// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_de_obra_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoDeObraDto _$TipoDeObraDtoFromJson(Map<String, dynamic> json) {
  return TipoDeObraDto(
    id: json['id'] as int,
    tipo: _$enumDecodeNullable(_$EnumTipoDeObraEnumMap, json['tipo']),
    descripcion: json['descripcion'] as String,
  );
}

Map<String, dynamic> _$TipoDeObraDtoToJson(TipoDeObraDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo': _$EnumTipoDeObraEnumMap[instance.tipo],
      'descripcion': instance.descripcion,
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

const _$EnumTipoDeObraEnumMap = {
  EnumTipoDeObra.comedia: 'comedia',
  EnumTipoDeObra.drama: 'drama',
  EnumTipoDeObra.ficcion: 'ficcion',
  EnumTipoDeObra.fantasia: 'fantasia',
  EnumTipoDeObra.historica: 'historica',
};
