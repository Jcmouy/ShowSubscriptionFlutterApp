// Denote which tables this DAO can access
import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/models/local/mensajes_table.dart';

part 'mensaje_dao.g.dart';

@UseDao(tables: [MensajesTable])
class MensajeDao extends DatabaseAccessor<AppDatabase> with _$MensajeDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  MensajeDao(this.db) : super(db);

  Future<List<MensajeDBRegister>> getAll() => select(mensajesTable).get();
  Stream<List<MensajeDBRegister>> watchAll() {
    return (select(mensajesTable)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.fecha),
            ]),
          ))
        .watch();
  }

  Future insertEntity(Insertable<MensajeDBRegister> mensaje) => into(mensajesTable).insert(mensaje);
  Future updateEntity(Insertable<MensajeDBRegister> mensaje) => update(mensajesTable).replace(mensaje);
  Future deleteEntity(Insertable<MensajeDBRegister> mensaje) => delete(mensajesTable).delete(mensaje);
}
