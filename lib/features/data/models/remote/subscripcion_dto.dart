import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';
import 'package:plataforma_app/features/domain/enums/enum_metodo_pago.dart';

part 'subscripcion_dto.g.dart';

@JsonSerializable()
class SubscripcionDto extends Subscripcion {
  const SubscripcionDto({
    @required int id,
    @required DateTime fecha,
    EnumMetodoPago metodoPago,
    int funcionId,
    int pagoId,
    int personaId,
  }) : super(id: id, fecha: fecha, metodoPago: metodoPago, funcionId: funcionId, pagoId: pagoId, personaId: personaId);

  factory SubscripcionDto.fromJson(Map<String, dynamic> json) => _$SubscripcionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubscripcionDtoToJson(this);
}
