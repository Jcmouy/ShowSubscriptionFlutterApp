import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/etiqueta.dart';

class Obra extends Equatable {
  final int id;
  final String nombre;
  final String descripcion;
  final String imagen;
  final String icono;
  final String protagonistas;
  final String direccion;
  final String autores;
  final DateTime fecha;
  final String duracion;
  final int tipoId;
  final List<Etiqueta> etiquetas;

  const Obra({
    @required this.id,
    @required this.nombre,
    this.descripcion,
    this.imagen,
    this.icono,
    this.protagonistas,
    this.direccion,
    this.autores,
    @required this.fecha,
    this.duracion,
    @required this.tipoId,
    this.etiquetas,
  });

  @override
  List<Object> get props => [id];
}
