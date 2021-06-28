import 'package:plataforma_app/features/data/models/remote/pais_dto.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';

class PaisDtoMapper {
  static PaisDto mapEntityToDto(Pais entity) {
    final PaisDto modelPais = PaisDto(id: entity.id, nombre: entity.nombre, codigo: entity.codigo);
    return modelPais;
  }
}
