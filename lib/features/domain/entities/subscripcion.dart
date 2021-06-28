import 'package:equatable/equatable.dart';
import 'package:plataforma_app/features/domain/enums/enum_metodo_pago.dart';

class Subscripcion extends Equatable {
  final int id;
  final DateTime fecha;
  final EnumMetodoPago metodoPago;
  final int funcionId;
  final int pagoId;
  final int personaId;

  const Subscripcion({this.id, this.fecha, this.metodoPago, this.funcionId, this.pagoId, this.personaId});

  @override
  List<Object> get props => [id, fecha, metodoPago, funcionId, personaId];
}
