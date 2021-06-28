import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';

abstract class GenericCrudRemoteClient<T> extends GenericReadOnlyRemoteClient<T> {
  Future<T> createEntity(T entity);

  Future<T> updateEntity(T entity);

  Future<void> deleteEntityById(int id);

  Future<void> deleteEntityByKey(String jsonKey);
}
