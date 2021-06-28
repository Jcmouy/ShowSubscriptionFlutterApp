import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/domain/entities/funcion.dart';

class FuncionDBMapper {
  static FuncionDBRegister mapEntityToDBRegister(Funcion entity) {
    if (entity == null) return null;
    final FuncionDBRegister register = FuncionDBRegister(
      id: entity.id,
      fecha: entity.fecha,
      monedaId: entity.monedaId,
      obraId: entity.obraId,
      paisId: entity.paisId,
      precio: entity.precio,
    );
    return register;
  }

  static Funcion mapDBRegisterToEntity(FuncionDBRegister table) {
    if (table == null) return null;
    final Funcion entity = Funcion(
      id: table.id,
      fecha: table.fecha,
      monedaId: table.monedaId,
      obraId: table.obraId,
      paisId: table.paisId,
      precio: table.precio,
    );
    return entity;
  }

  static List<Funcion> mapListDBRegisterToListEntity(List<FuncionDBRegister> registers) {
    if (registers == null) return null;
    return registers.map(mapDBRegisterToEntity).toList();
  }
}
