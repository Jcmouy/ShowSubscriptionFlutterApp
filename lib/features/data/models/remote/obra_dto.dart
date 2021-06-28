import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/mappers/model/etiqueta_model_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/etiqueta_dto.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';

class ObraDto extends Obra {
  const ObraDto({
    @required int id,
    @required String nombre,
    String descripcion,
    String imagen,
    String icono,
    String protagonistas,
    String direccion,
    String autores,
    @required DateTime fecha,
    String duracion,
    @required int tipoId,
    List<EtiquetaDto> etiquetas,
  }) : super(
            id: id,
            nombre: nombre,
            descripcion: descripcion,
            imagen: imagen,
            icono: icono,
            protagonistas: protagonistas,
            direccion: direccion,
            autores: autores,
            fecha: fecha,
            duracion: duracion,
            tipoId: tipoId,
            etiquetas: etiquetas);

  factory ObraDto.fromJson(Map<String, dynamic> json) {
    return ObraDto(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      tipoId: json['tipoId'] as int,
      autores: json['autores'] as String,
      descripcion: json['descripcion'] as String,
      direccion: json['direccion'] as String,
      duracion: json['duracion'] as String,
      etiquetas: EtiquetaDtoMapper.mapJsonArrayToDto(json['etiquetas'] as List<dynamic>),
      icono: json['icono'] as String,
      imagen: json['imagen'] as String,
      protagonistas: json['protagonistas'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipoDeObraId': tipoId,
      'fecha': fecha.toIso8601String(),
      'autores': autores,
      'descripcion': descripcion,
      'direccion': direccion,
      'duracion': duracion,
      'icono': icono,
      'imagen': imagen,
      'protagonistas': protagonistas,
      'etiquetas': jsonEncode(etiquetas),
    };
  }
}
