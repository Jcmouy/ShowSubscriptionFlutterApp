// Denote which tables this DAO can access
import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/models/local/paises_table.dart';

part 'pais_dao.g.dart';

@UseDao(tables: [PaisesTable])
class PaisDao extends DatabaseAccessor<AppDatabase> with _$PaisDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  PaisDao(this.db) : super(db);

  Future<List<PaisDBRegister>> getAll() => select(paisesTable).get();

  Future<PaisDBRegister> getById(int id) {
    return (select(paisesTable)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<PaisDBRegister>> watchAllPaises() => select(paisesTable).watch();
  Future insertEntity(Insertable<PaisDBRegister> pais) => into(paisesTable).insert(pais);
  Future updateEntity(Insertable<PaisDBRegister> pais) => update(paisesTable).replace(pais);
  Future deleteEntity(Insertable<PaisDBRegister> pais) => delete(paisesTable).delete(pais);
}
