import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/enums/enum_tipo_de_obra.dart';

class TipoDeObra extends Equatable {
  final int id;
  final EnumTipoDeObra tipo;
  final String descripcion;

  const TipoDeObra({@required this.id, @required this.tipo, this.descripcion});

  @override
  List<Object> get props => [id];
}
