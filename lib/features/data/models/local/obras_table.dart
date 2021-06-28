import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("ObraDBRegister")
class ObrasTable extends Table {
  IntColumn get id => integer()();
  TextColumn get nombre => text()();
  TextColumn get descripcion => text().nullable()();
  TextColumn get imagen => text().nullable()();
  DateTimeColumn get fecha => dateTime()();
  TextColumn get icono => text().nullable()();
  TextColumn get protagonistas => text().nullable()();
  TextColumn get direccion => text().nullable()();
  TextColumn get autores => text().nullable()();
  TextColumn get duracion => text().nullable()();
  IntColumn get tipoId => integer()();
  TextColumn get etiquetas => text().nullable()();

  @override
  String get tableName => 'obras';
}
