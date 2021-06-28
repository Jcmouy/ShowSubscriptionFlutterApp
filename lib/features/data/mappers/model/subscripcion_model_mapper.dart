import 'package:plataforma_app/features/data/models/remote/subscripcion_dto.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';

class SubscripcionDtoMapper {
  static SubscripcionDto mapEntityToDto(Subscripcion entity) {
    final SubscripcionDto model = SubscripcionDto(
      id: entity.id,
      fecha: entity.fecha,
      funcionId: entity.funcionId,
      metodoPago: entity.metodoPago,
      pagoId: entity.pagoId,
      personaId: entity.personaId,
    );
    return model;
  }

  static Subscripcion mapDtoToEntity(SubscripcionDto model) {
    final Subscripcion entity = Subscripcion(
      id: model.id,
      fecha: model.fecha,
      funcionId: model.funcionId,
      metodoPago: model.metodoPago,
      pagoId: model.pagoId,
      personaId: model.personaId,
    );
    return entity;
  }
}
