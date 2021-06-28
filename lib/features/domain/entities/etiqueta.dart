import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Etiqueta extends Equatable {
  final int id;
  final String nombre;

  const Etiqueta({@required this.id, @required this.nombre});

  @override
  List<Object> get props => [id];
}
