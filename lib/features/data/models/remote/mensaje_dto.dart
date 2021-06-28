import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/mensaje.dart';

part 'mensaje_dto.g.dart';

@JsonSerializable()
class MensajeDto extends Mensaje {
  const MensajeDto({
    int id,
    String remitente,
    String destinatario,
    @required DateTime fecha,
    @required String tipoContenido,
    @required String valor,
    String resumen,
    @required int obraId,
  }) : super(
            id: id,
            remitente: remitente,
            destinatario: destinatario,
            fecha: fecha,
            tipoContenido: tipoContenido,
            valor: valor,
            resumen: resumen,
            obraId: obraId);

  factory MensajeDto.fromJson(Map<String, dynamic> json) => _$MensajeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MensajeDtoToJson(this);

  MensajeDto copyWith({
    int id,
    String remitente,
    String destinatario,
    DateTime fecha,
    String tipoContenido,
    String valor,
    String resumen,
    int obraId,
  }) {
    return MensajeDto(
      id: id ?? this.id,
      remitente: remitente ?? this.remitente,
      destinatario: destinatario ?? this.destinatario,
      fecha: fecha ?? this.fecha,
      tipoContenido: tipoContenido ?? this.tipoContenido,
      valor: valor ?? this.valor,
      resumen: resumen ?? this.resumen,
      obraId: obraId ?? this.obraId,
    );
  }
}
