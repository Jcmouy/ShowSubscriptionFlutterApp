import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/usuario_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class UsuarioRemoteDataSource extends GenericCrudRemoteDataSource<UsuarioDto> {
  Future<UsuarioDto> getEntityByLogin(String login);
}

@Injectable(as: UsuarioRemoteDataSource)
class UsuarioRemoteDataSourceImpl implements UsuarioRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final UsuarioRemoteClient usuarioRemoteClient;

  UsuarioRemoteDataSourceImpl({@required this.authorizationRepository, @required this.usuarioRemoteClient});

  @override
  Future<UsuarioDto> getEntityById(int id) async {
    try {
      return usuarioRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<UsuarioDto> getEntityByLogin(String login) async {
    try {
      return usuarioRemoteClient.getEntityByLogin(login);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<UsuarioDto>> getAllEntities() async {
    try {
      return usuarioRemoteClient.getAllEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return [];
  }

  @override
  Future<int> countEntities() async {
    try {
      return usuarioRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }

  @override
  Future<UsuarioDto> createEntity(UsuarioDto entity) async {
    try {
      return usuarioRemoteClient.createEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<UsuarioDto> updateEntity(UsuarioDto entity) async {
    try {
      return usuarioRemoteClient.updateEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<void> deleteEntityById(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEntityByKey(String key) async {
    final String jsonKey = '{login: $key}';
    try {
      return usuarioRemoteClient.deleteEntityByKey(jsonKey);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
  }
}
