import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Contenido extends Equatable {
  final int id;
  final String indice;
  final String subIndice;
  final String tipoContenido;
  final String valor;
  final String resumen;
  final int obraId;

  const Contenido(
      {@required this.id,
      @required this.indice,
      @required this.subIndice,
      @required this.tipoContenido,
      @required this.valor,
      this.resumen,
      @required this.obraId});

  @override
  List<Object> get props => [id];
}
