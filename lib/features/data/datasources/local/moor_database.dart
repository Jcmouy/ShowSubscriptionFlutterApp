import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/funciones_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/mensaje_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/obras_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/persona_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/usuario_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/pais_dao.dart';
import 'package:plataforma_app/features/data/models/local/funcion_table.dart';
import 'package:plataforma_app/features/data/models/local/mensajes_table.dart';
import 'package:plataforma_app/features/data/models/local/obras_table.dart';
import 'package:plataforma_app/features/data/models/local/personas_table.dart';
import 'package:plataforma_app/features/data/models/local/usuarios_table.dart';
import 'package:plataforma_app/features/data/models/local/paises_table.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;
// Moor works by source gen. This file will all the generated code.
part 'moor_database.g.dart';

@UseMoor(
    tables: [MensajesTable, UsuariosTable, PersonasTable, PaisesTable, ObrasTable, FuncionesTable],
    daos: [MensajeDao, UsuarioDao, PersonaDao, PaisDao, ObraDao, FuncionDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: constants.DBConstants.dbName,
          // Good for debugging - prints SQL in the console
          logStatements: true,
        ));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        // Runs if the database has already been opened on the device with a lower version
        onUpgrade: (migrator, from, to) async {
          if (from == 1) {
            //Do nothing for now
          }
        },
      );
}
