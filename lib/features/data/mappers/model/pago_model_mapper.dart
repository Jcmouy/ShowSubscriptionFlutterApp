import 'package:plataforma_app/features/data/models/remote/pago_dto.dart';
import 'package:plataforma_app/features/domain/entities/pago.dart';

class PagoDtoMapper {
  static PagoDto mapEntityToDto(Pago entity) {
    final PagoDto model = PagoDto(
      id: entity.id,
      fechaExterna: entity.fechaExterna,
      idExterno: entity.idExterno,
    );
    return model;
  }

  static Pago mapDtoToEntity(PagoDto model) {
    final Pago entity = Pago(
      id: model.id,
      fechaExterna: model.fechaExterna,
      idExterno: model.idExterno,
    );
    return entity;
  }
}
