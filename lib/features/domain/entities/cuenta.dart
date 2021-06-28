import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Cuenta extends Equatable {
  final int id;
  final String codigo;
  final String nombre;
  final DateTime fechaBaja;

  const Cuenta({@required this.id, @required this.codigo, @required this.nombre, this.fechaBaja});

  @override
  List<Object> get props => [id];
}
