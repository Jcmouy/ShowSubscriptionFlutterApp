import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Funcion extends Equatable {
  final int id;
  final DateTime fecha;
  final double precio;
  final int monedaId;
  final int paisId;
  final int obraId;

  const Funcion({
    @required this.id,
    @required this.fecha,
    this.precio,
    this.monedaId,
    @required this.paisId,
    @required this.obraId,
  });

  @override
  List<Object> get props => [id];
}
