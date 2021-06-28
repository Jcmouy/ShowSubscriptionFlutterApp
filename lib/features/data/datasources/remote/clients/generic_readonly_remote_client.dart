abstract class GenericReadOnlyRemoteClient<T> {
  Future<T> getEntityById(int id);

  Future<List<T>> getAllEntities({String query});

  Future<int> countEntities();
}
