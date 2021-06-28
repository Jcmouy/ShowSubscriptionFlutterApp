import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Mensaje extends Equatable {
  final int id;
  final String remitente;
  final String destinatario;
  final DateTime fecha;
  final String tipoContenido;
  final String valor;
  final String resumen;
  final int obraId;

  const Mensaje(
      {this.id,
      this.remitente,
      this.destinatario,
      @required this.fecha,
      @required this.tipoContenido,
      @required this.valor,
      this.resumen,
      @required this.obraId});

  @override
  List<Object> get props => [tipoContenido, valor, fecha, obraId];
}
