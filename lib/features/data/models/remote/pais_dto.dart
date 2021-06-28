import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';

part 'pais_dto.g.dart';

@JsonSerializable()
class PaisDto extends Pais {
  const PaisDto({
    @required int id,
    @required String codigo,
    @required String nombre,
  }) : super(id: id, codigo: codigo, nombre: nombre);

  factory PaisDto.fromJson(Map<String, dynamic> json) => _$PaisDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaisDtoToJson(this);
}
