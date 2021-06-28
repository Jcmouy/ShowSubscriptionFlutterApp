import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("FuncionDBRegister")
class FuncionesTable extends Table {
  IntColumn get id => integer()();
  DateTimeColumn get fecha => dateTime()();
  IntColumn get monedaId => integer()();
  IntColumn get paisId => integer()();
  IntColumn get obraId => integer()();
  RealColumn get precio => real()();

  @override
  String get tableName => 'funciones';
}
