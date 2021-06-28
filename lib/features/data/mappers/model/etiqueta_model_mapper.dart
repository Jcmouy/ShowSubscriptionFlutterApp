import 'dart:convert';

import 'package:plataforma_app/features/data/models/remote/etiqueta_dto.dart';
import 'package:plataforma_app/features/domain/entities/etiqueta.dart';

class EtiquetaDtoMapper {
  static List<EtiquetaDto> mapJsonArrayToDto(List<dynamic> jsonString) {
    return jsonString.map((m) => EtiquetaDto.fromJson(m as Map<String, dynamic>)).toList();
  }

  static String mapListToJsonArray(List<Etiqueta> etiquetas) {
    return jsonEncode(etiquetas);
  }
}
