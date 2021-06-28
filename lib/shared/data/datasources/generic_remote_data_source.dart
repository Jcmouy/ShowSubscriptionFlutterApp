import 'package:plataforma_app/core/error/exceptions.dart';

abstract class GenericRemoteDataSource<T> {
  /// Calls the api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<T> getEntityById(int id);

  Future<List<T>> getAllEntities();

  Future<int> countEntities();
}

abstract class GenericCrudRemoteDataSource<T> extends GenericRemoteDataSource<T> {
  Future<T> createEntity(T entity);

  Future<T> updateEntity(T entity);

  Future<void> deleteEntityById(int id);

  Future<void> deleteEntityByKey(String jsonKey);
}
