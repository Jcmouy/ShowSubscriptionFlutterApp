import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/tipo_de_obra.dart';
import 'package:plataforma_app/features/domain/enums/enum_tipo_de_obra.dart';

part 'tipo_de_obra_dto.g.dart';

@JsonSerializable()
class TipoDeObraDto extends TipoDeObra {
  const TipoDeObraDto({
    @required int id,
    @required EnumTipoDeObra tipo,
    String descripcion,
  }) : super(id: id, tipo: tipo, descripcion: descripcion);

  factory TipoDeObraDto.fromJson(Map<String, dynamic> json) => _$TipoDeObraDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TipoDeObraDtoToJson(this);
}
