import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Persona extends Equatable {
  final int id;
  final String codigo;
  final String nombres;
  final String apellidos;
  final DateTime fechaNacimiento;
  final String correoElectronico;
  final String telefono;
  final int cuentaId;
  final int usuarioId;
  final int paisId;

  const Persona(
      {this.id,
      @required this.codigo,
      @required this.nombres,
      @required this.apellidos,
      this.fechaNacimiento,
      @required this.correoElectronico,
      this.telefono,
      this.cuentaId,
      this.usuarioId,
      @required this.paisId});

  @override
  List<Object> get props => [id, codigo, paisId];
}
