import 'package:meta/meta.dart';
import 'package:plataforma_app/core/error/exceptions.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';
import 'package:plataforma_app/shared/domain/generic_readonly_entity_repository.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;

class GenericReadonlyWithCacheRepositoryImpl<T> implements GenericReadonlyEntityRepository<T> {
  final GenericRemoteDataSource remoteDataSource;
  final GenericCacheDataSource cacheDataSource;
  final NetworkInfo networkInfo;

  GenericReadonlyWithCacheRepositoryImpl({
    @required this.remoteDataSource,
    @required this.cacheDataSource,
    @required this.networkInfo,
  });

  @override
  Future<T> getEntidadById(int id) async {
    return _getEntidad(id);
  }

  @override
  Future<List<T>> getAllEntidades() async {
    return _getEntidades();
  }

  @override
  Future<int> countEntidades() async {
    return _count();
  }

  Future<T> _getEntidad(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final T remoteEntity = await remoteDataSource.getEntityById(id) as T;
        cacheDataSource.cacheEntity(remoteEntity);
        return remoteEntity;
      } on ServerException {
        throw ServerException.defaultMessage();
      }
    } else {
      try {
        final T localEntity = await cacheDataSource.getLastEntity() as T;
        return localEntity;
      } on CacheException {
        throw CacheException.defaultMessage();
      }
    }
  }

  Future<int> _count() async {
    if (await networkInfo.isConnected) {
      try {
        final int remoteCount = await remoteDataSource.countEntities();
        cacheDataSource.cacheCount(remoteCount);
        return remoteCount;
      } on ServerException {
        throw ServerException.defaultMessage();
      }
    } else {
      try {
        final localCount = await cacheDataSource.getLastCount();
        return localCount;
      } on CacheException {
        throw CacheException.defaultMessage();
      }
    }
  }

  Future<List<T>> _getEntidades() async {
    //TODO implementar cache de entidades?
    if (await networkInfo.isConnected) {
      try {
        final Future<List<T>> remoteEntities = remoteDataSource.getAllEntities() as Future<List<T>>;
        return remoteEntities;
      } on ServerException {
        throw ServerException.defaultMessage();
      }
    } else {
      throw ServerException(constants.FailureMessages.serverFailureMessage);
    }
  }
}
