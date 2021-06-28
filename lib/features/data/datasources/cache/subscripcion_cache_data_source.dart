import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/subscripcion_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SubscripcionCacheDataSource
    extends GenericCacheDataSource<SubscripcionDto> {}

@Injectable(as: SubscripcionCacheDataSource)
class SubscripcionCacheDataSourceImpl extends GenericCacheDataSourceImpl<SubscripcionDto> implements SubscripcionCacheDataSource {

  SubscripcionCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'SUBSCRIPCION';
  }

  @override
  Future<SubscripcionDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson =
    await super.getLastEntityAsMap();
    return Future.value(SubscripcionDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(SubscripcionDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
