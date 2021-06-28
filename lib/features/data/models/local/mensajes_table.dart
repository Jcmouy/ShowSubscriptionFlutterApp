import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("MensajeDBRegister")
class MensajesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remitente => text().nullable()();
  TextColumn get destinatario => text().nullable()();
  DateTimeColumn get fecha => dateTime()();
  TextColumn get tipoContenido => text().withLength(min: 1, max: 50)();
  TextColumn get valor => text().withLength(min: 1, max: 50)();
  TextColumn get resumen => text().nullable()();
  IntColumn get obraId => integer()();

  @override
  String get tableName => 'mensajes';
}
