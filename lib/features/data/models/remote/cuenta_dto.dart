import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/cuenta.dart';

part 'cuenta_dto.g.dart';

@JsonSerializable()
class CuentaDto extends Cuenta {
  const CuentaDto({
    @required int id,
    @required String codigo,
    @required String nombre,
    DateTime fechaBaja,
  }) : super(id: id, codigo: codigo, nombre: nombre, fechaBaja: fechaBaja);

  factory CuentaDto.fromJson(Map<String, dynamic> json) => _$CuentaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CuentaDtoToJson(this);
}
