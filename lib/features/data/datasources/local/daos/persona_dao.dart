import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/models/local/personas_table.dart';

part 'persona_dao.g.dart';

@UseDao(tables: [PersonasTable])
class PersonaDao extends DatabaseAccessor<AppDatabase> with _$PersonaDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  PersonaDao(this.db) : super(db);

  Future<List<PersonaDBRegister>> getAll() => select(personasTable).get();

  Future<PersonaDBRegister> getByCodigo(String codigo) {
    return (select(personasTable)..where((t) => t.codigo.equals(codigo))).getSingle();
  }

  Stream<List<PersonaDBRegister>> watchAllPersonas() => select(personasTable).watch();
  Future insertPersona(PersonaDBRegister persona) => into(personasTable).insert(persona);
  Future updatePersona(PersonaDBRegister persona) => update(personasTable).replace(persona);
  Future deletePersona(PersonaDBRegister persona) => delete(personasTable).delete(persona);
}
