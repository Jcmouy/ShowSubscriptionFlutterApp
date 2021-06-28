import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("UsuarioDBRegister")
class UsuariosTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get login => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get imagenPath => text().nullable()();
  BoolColumn get activated => boolean().nullable()();
  TextColumn get langKey => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdDate => dateTime().nullable()();
  TextColumn get lastModifiedBy => text().nullable()();
  DateTimeColumn get lastModifiedDate => dateTime().nullable()();
  TextColumn get password => text().nullable()();
  TextColumn get authorities => text().nullable()();

  @override
  String get tableName => 'usuarios';
}
