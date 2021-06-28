import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/etiqueta.dart';

part 'etiqueta_dto.g.dart';

@JsonSerializable()
class EtiquetaDto extends Etiqueta {
  const EtiquetaDto({
    @required int id,
    @required String nombre,
  }) : super(id: id, nombre: nombre);

  factory EtiquetaDto.fromJson(Map<String, dynamic> json) => _$EtiquetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EtiquetaDtoToJson(this);
}
