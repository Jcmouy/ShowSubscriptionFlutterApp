import 'package:moor_flutter/moor_flutter.dart';
import 'package:plataforma_app/features/data/datasources/local/moor_database.dart';
import 'package:plataforma_app/features/data/models/local/usuarios_table.dart';

part 'usuario_dao.g.dart';

@UseDao(tables: [UsuariosTable])
class UsuarioDao extends DatabaseAccessor<AppDatabase> with _$UsuarioDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  UsuarioDao(this.db) : super(db);

  Future<List<UsuarioDBRegister>> getAll() => select(usuariosTable).get();

  Future<UsuarioDBRegister> getByLogin(String login) {
    return (select(usuariosTable)..where((t) => t.login.equals(login))).getSingle();
  }

  Stream<List<UsuarioDBRegister>> watchAllUsuarios() => select(usuariosTable).watch();
  Future insertUsuario(UsuarioDBRegister usuario) => into(usuariosTable).insert(usuario);
  Future updateUsuario(UsuarioDBRegister usuario) => update(usuariosTable).replace(usuario);
  Future deleteUsuario(UsuarioDBRegister usuario) => delete(usuariosTable).delete(usuario);
}
