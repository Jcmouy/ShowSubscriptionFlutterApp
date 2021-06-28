import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/models/local/funcion_table.dart';

part 'funciones_dao.g.dart';

@UseDao(tables: [FuncionesTable])
class FuncionDao extends DatabaseAccessor<AppDatabase> with _$FuncionDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  FuncionDao(this.db) : super(db);

  Future<List<FuncionDBRegister>> getAll() => select(funcionesTable).get();

  Future<FuncionDBRegister> getById(int id) {
    return (select(funcionesTable)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<FuncionDBRegister>> watchAllFunciones() => select(funcionesTable).watch();
  Future insertFuncion(FuncionDBRegister funcion) => into(funcionesTable).insert(funcion);
  Future updateFuncion(FuncionDBRegister funcion) => update(funcionesTable).replace(funcion);
  Future deleteFuncion(FuncionDBRegister funcion) => delete(funcionesTable).delete(funcion);
}
