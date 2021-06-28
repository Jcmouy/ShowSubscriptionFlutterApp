import 'package:meta/meta.dart';
import 'package:plataforma_app/core/error/exceptions.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';
import 'package:plataforma_app/shared/domain/generic_crud_entity_repository.dart';

typedef RemoteCallJson = Future<String> Function(Map<String, dynamic> entityAsJson);
typedef RemoteCallString = Future<String> Function(String entityAsString);

abstract class GenericCrudRepositoryImpl<T> extends GenericReadonlyRepositoryImpl<T> implements GenericCrudEntityRepository<T> {
  GenericCrudRemoteDataSource remoteCrudDataSource;

  Map<String, dynamic> getEntityAsJson(T entity);

  dynamic mapEntityToDto(T entity) {
    return null;
  }

  T mapDtoToEntity(dynamic model) {
    return null;
  }

  GenericCrudRepositoryImpl({
    @required this.remoteCrudDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteDataSource: remoteCrudDataSource, networkInfo: networkInfo);

  @override
  Future<T> createEntity(T entity) async {
    dynamic model = mapEntityToDto(entity);
    model = await remoteCrudDataSource.createEntity(model);

    return mapDtoToEntity(model);
    //return _invokeAPIWriteEndpoint(jsonEntity, remoteCrudDataSource.createEntity as Future<String> Function(Map<String, dynamic>));
  }

  @override
  Future<T> updateEntity(T entity) async {
    return _invokeAPIWriteEndpoint(
        getEntityAsJson(entity), remoteCrudDataSource.updateEntity as Future<String> Function(Map<String, dynamic>));
  }

  @override
  Future<void> deleteEntityById(int id) async {
    return _invokeAPIStringParameter(id.toString(), remoteCrudDataSource.deleteEntityById as Future<String> Function(String));
  }

  @override
  Future<void> deleteEntityByKey(String jsonKey) async {
    return _invokeAPIStringParameter(jsonKey, remoteCrudDataSource.deleteEntityByKey as Future<String> Function(String));
  }

  Future<T> _invokeAPIWriteEndpoint(Map<String, dynamic> parameter, RemoteCallJson apiEndpoint) async {
    if (await networkInfo.isConnected) {
      try {
        final Future<T> remoteEntity = await apiEndpoint(parameter) as Future<T>;
        return remoteEntity;
      } on ServerException {
        throw ServerException.defaultMessage();
      }
    } else {
      throw NetworkException();
    }
  }

  Future<T> _invokeAPIStringParameter(String parameter, RemoteCallString apiEndpoint) async {
    if (await networkInfo.isConnected) {
      try {
        final Future<T> remoteEntity = await apiEndpoint(parameter) as Future<T>;
        return remoteEntity;
      } on ServerException {
        throw ServerException.defaultMessage();
      }
    } else {
      throw NetworkException();
    }
  }
}
