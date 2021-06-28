import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/models/local/obras_table.dart';

part 'obras_dao.g.dart';

@UseDao(tables: [ObrasTable])
class ObraDao extends DatabaseAccessor<AppDatabase> with _$ObraDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ObraDao(this.db) : super(db);

  Future<List<ObraDBRegister>> getAll() => select(obrasTable).get();

  Future<ObraDBRegister> getById(int id) {
    return (select(obrasTable)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<ObraDBRegister>> watchAllObras() => select(obrasTable).watch();
  Future insertObra(ObraDBRegister obra) => into(obrasTable).insert(obra);
  Future updateObra(ObraDBRegister obra) => update(obrasTable).replace(obra);
  Future deleteObra(ObraDBRegister obra) => delete(obrasTable).delete(obra);
}
