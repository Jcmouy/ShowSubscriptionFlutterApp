import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("PersonaDBRegister")
class PersonasTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get codigo => text().nullable()();
  TextColumn get nombres => text().nullable()();
  TextColumn get apellidos => text().nullable()();
  DateTimeColumn get fechaNacimiento => dateTime()();
  TextColumn get correoElectronico => text().nullable()();
  TextColumn get telefono => text().nullable()();
  IntColumn get cuentaId => integer()();
  IntColumn get usuarioId => integer().nullable()();
  IntColumn get paisId => integer()();

  @override
  String get tableName => 'personas';
}
