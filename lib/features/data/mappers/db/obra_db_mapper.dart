import 'dart:convert';

import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/mappers/model/etiqueta_model_mapper.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';

class ObraDBMapper {
  static ObraDBRegister mapEntityToDBRegister(Obra entity) {
    if (entity == null) return null;
    final ObraDBRegister register = ObraDBRegister(
      id: entity.id,
      nombre: entity.nombre,
      fecha: entity.fecha,
      tipoId: entity.tipoId,
      autores: entity.autores,
      descripcion: entity.descripcion,
      direccion: entity.direccion,
      duracion: entity.duracion,
      icono: entity.icono,
      imagen: entity.imagen,
      protagonistas: entity.protagonistas,
      etiquetas: EtiquetaDtoMapper.mapListToJsonArray(entity.etiquetas),
    );
    return register;
  }

  static Obra mapDBRegisterToEntity(ObraDBRegister register) {
    if (register == null) return null;
    final Obra entity = Obra(
      id: register.id,
      nombre: register.nombre,
      fecha: register.fecha,
      autores: register.autores,
      descripcion: register.descripcion,
      duracion: register.duracion,
      direccion: register.direccion,
      tipoId: register.tipoId,
      icono: register.icono,
      imagen: register.imagen,
      protagonistas: register.protagonistas,
      etiquetas: EtiquetaDtoMapper.mapJsonArrayToDto(jsonDecode(register.etiquetas) as List<dynamic>),
    );
    return entity;
  }
}
