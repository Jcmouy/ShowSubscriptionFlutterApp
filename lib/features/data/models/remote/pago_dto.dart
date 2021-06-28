import 'package:json_annotation/json_annotation.dart';
import 'package:plataforma_app/features/domain/entities/pago.dart';

part 'pago_dto.g.dart';

@JsonSerializable()
class PagoDto extends Pago {
  const PagoDto({
    int id,
    String idExterno,
    DateTime fechaExterna,
  }) : super(id: id, idExterno: idExterno, fechaExterna: fechaExterna);

  factory PagoDto.fromJson(Map<String, dynamic> json) => _$PagoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PagoDtoToJson(this);
}
