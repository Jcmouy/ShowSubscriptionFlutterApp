import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/funcion.dart';

part 'funcion_dto.g.dart';

@JsonSerializable()
class FuncionDto extends Funcion {
  const FuncionDto({
    @required int id,
    @required DateTime fecha,
    double precio,
    int monedaId,
    @required int paisId,
    @required int obraId,
  }) : super(id: id, fecha: fecha, precio: precio, monedaId: monedaId, paisId: paisId, obraId: obraId);

  factory FuncionDto.fromJson(Map<String, dynamic> json) => _$FuncionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionDtoToJson(this);
}
