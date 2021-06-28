import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("PaisDBRegister")
class PaisesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get codigo => text()();
  TextColumn get nombre => text()();

  @override
  String get tableName => 'paises';
}
