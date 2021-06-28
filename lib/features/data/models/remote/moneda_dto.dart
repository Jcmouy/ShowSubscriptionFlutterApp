import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/moneda.dart';

part 'moneda_dto.g.dart';

@JsonSerializable()
class MonedaDto extends Moneda {
  const MonedaDto({
    @required int id,
    @required String codigo,
    @required String nombre,
  }) : super(id: id, codigo: codigo, nombre: nombre);

  factory MonedaDto.fromJson(Map<String, dynamic> json) => _$MonedaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MonedaDtoToJson(this);
}
