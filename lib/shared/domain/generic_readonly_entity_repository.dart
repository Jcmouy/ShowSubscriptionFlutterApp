
abstract class GenericReadonlyEntityRepository<T> {
  Future<T> getEntidadById(int id);

  Future<List<T>> getAllEntidades();

  Future<int> countEntidades();
}
