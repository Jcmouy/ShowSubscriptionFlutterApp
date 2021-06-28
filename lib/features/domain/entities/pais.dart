import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Pais extends Equatable {
  final int id;
  final String codigo;
  final String nombre;

  const Pais({@required this.id, @required this.codigo, @required this.nombre});

  @override
  List<Object> get props => [id];
}
