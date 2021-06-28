import 'package:equatable/equatable.dart';

class Pago extends Equatable {
  final int id;
  final String idExterno;
  final DateTime fechaExterna;

  const Pago({this.id, this.idExterno, this.fechaExterna});

  @override
  List<Object> get props => [idExterno];
}
