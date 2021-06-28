import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;

abstract class GenericCacheDataSource<T> {
  /// Gets the cached Model which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<T> getLastEntity();

  Future<void> cacheEntity(T entityToCache);

  Future<int> getLastCount();

  Future<void> cacheCount(int count);
}

abstract class GenericCacheDataSourceImpl<T> implements GenericCacheDataSource<T> {
  final SharedPreferences sharedPreferences;

  GenericCacheDataSourceImpl({@required this.sharedPreferences});

  String getEntityName();

  String getEntityCacheKey() {
    return 'CACHED_${getEntityName()}';
  }

  String getCountCacheKey() {
    return 'CACHED_${getEntityName()}_COUNT';
  }

  @override
  Future<T> getLastEntity();

  Future<Map<String, dynamic>> getLastEntityAsMap() {
    final jsonString = sharedPreferences.getString(getEntityCacheKey());
    if (jsonString != null) {
      return Future.value(json.decode(jsonString) as Map<String, dynamic>);
    } else {
      throw CacheException(constants.FailureMessages.cacheFailureMessage);
    }
  }

  @override
  Future<void> cacheEntity(T entity);

  Future<void> cacheEntityAsJson(Map<String, dynamic> entityAsJson) {
    return sharedPreferences.setString(
      getEntityCacheKey(),
      json.encode(entityAsJson),
    );
  }

  @override
  Future<int> getLastCount() {
    final count = sharedPreferences.getString(getCountCacheKey());
    if (count != null) {
      return Future.value((count as num).toInt());
    } else {
      throw CacheException(constants.FailureMessages.cacheFailureMessage);
    }
  }

  @override
  Future<void> cacheCount(int count) {
    return sharedPreferences.setString(
      getCountCacheKey(),
      '$count',
    );
  }
}
