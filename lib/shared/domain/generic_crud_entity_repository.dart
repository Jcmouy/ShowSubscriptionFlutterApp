import 'package:plataforma_app/shared/domain/generic_readonly_entity_repository.dart';

abstract class GenericCrudEntityRepository<T> extends GenericReadonlyEntityRepository<T>{
  Future<T> createEntity(T entity);

  Future<T> updateEntity(T entity);

  Future<void> deleteEntityById(int id);

  Future<void> deleteEntityByKey(String jsonKey);
}
