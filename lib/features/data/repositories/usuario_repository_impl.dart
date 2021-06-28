import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/usuario_remote_data_source.dart';
import 'package:plataforma_app/features/data/mappers/model/usuario_model_mapper.dart';
import 'package:plataforma_app/features/data/mappers/model/usuario_account_model_mapper.dart';
import 'package:plataforma_app/features/data/mappers/model/usuario_account_change_password_model_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_dto.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_account_dto.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_account_change_password_dto.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/domain/entities/password_usuario.dart';
import 'package:plataforma_app/features/domain/repositories/usuario_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_crud_repository_impl.dart';
import 'package:plataforma_app/features/data/datasources/remote/account_remote_data_source.dart';
import 'package:plataforma_app/features/data/datasources/local/dao_factory.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/usuario_dao.dart';
import 'package:plataforma_app/features/data/mappers/db/usuario_db_mapper.dart';

@Injectable(as: UsuarioRepository)
class UsuarioRepositoryImpl extends GenericCrudRepositoryImpl<Usuario> implements UsuarioRepository {
  final DaoProvider daoProvider;
  AccountRemoteDataSource accountRemoteDataSource;

  UsuarioRepositoryImpl({
    @required this.accountRemoteDataSource,
    @required UsuarioRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
    @required this.daoProvider,
  }) : super(remoteCrudDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Map<String, dynamic> getEntityAsJson(Usuario entity) {
    final UsuarioDto usuarioDto = UsuarioDtoMapper.mapEntityToDto(entity);
    return usuarioDto.toJson();
  }

  @override
  Future<void> registerUserAccount(Usuario usuario) async {
    final UsuarioDto usuarioDto = UsuarioDtoMapper.mapEntityToDto(usuario);
    final UsuarioAccountDto usuarioAccountDto = UsuarioAccountDtoMapper.mapEntityToDto(usuario);
    if (UsuarioDto != null) {
      if (await networkInfo.isConnected) {
        await accountRemoteDataSource.registerUser(usuarioAccountDto);
        await _insertUserDB(usuarioDto);
      }
      return;
    }
  }

  Future<void> _insertUserDB(UsuarioDto usuarioDto) async {
    final UsuarioDao usuarioDao = daoProvider.getUsuarioDao();
    await usuarioDao.insertUsuario(UsuarioDBMapper.mapEntityToDBRegister(usuarioDto));
  }

  @override
  Future<bool> changeUserAccountPassword(PasswordUsuario passwordUsuario) async {
    final UsuarioAccountChangePasswordDto usuarioAccountChangePasswordDto =
        UsuarioAccountChangePasswordDtoMapper.mapEntityToDto(passwordUsuario);
    return accountRemoteDataSource.changePassword(usuarioAccountChangePasswordDto);
  }

  @override
  Future<Usuario> getEntityByLogin(String login) async {
    final UsuarioDao usuarioDao = daoProvider.getUsuarioDao();
    final Usuario usuario = UsuarioDBMapper.mapDBRegisterToEntity(await usuarioDao.getByLogin(login));
    if (usuario != null) {
      return usuario;
    } else {
      if (await networkInfo.isConnected) {
        final UsuarioDto usuario = await (remoteDataSource as UsuarioRemoteDataSource).getEntityByLogin(login);
        _insertUserDB(usuario);
        return usuario;
      }
      return null;
    }
  }
}
