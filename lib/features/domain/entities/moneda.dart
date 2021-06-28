import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Moneda extends Equatable {
  final int id;
  final  String codigo;
  final  String nombre;

  const Moneda({@required this.id, @required this.codigo, @required this.nombre});

  @override
  List<Object> get props => [id];
}
