import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/funciones_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/obras_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/persona_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/usuario_dao.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/pais_dao.dart';

import 'moor_database.dart';

@singleton
class DaoProvider {
  final AppDatabase appDatabase = AppDatabase();

  ObraDao getObraDao() {
    return appDatabase.obraDao;
  }

  FuncionDao getFuncionDao() {
    return appDatabase.funcionDao;
  }

  PersonaDao getPersonaDao() {
    return appDatabase.personaDao;
  }

  UsuarioDao getUsuarioDao() {
    return appDatabase.usuarioDao;
  }

  PaisDao getPaisDao() {
    return appDatabase.paisDao;
  }
}
