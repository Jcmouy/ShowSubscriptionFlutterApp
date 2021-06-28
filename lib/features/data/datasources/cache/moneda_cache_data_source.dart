import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/moneda_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MonedaCacheDataSource
    extends GenericCacheDataSource<MonedaDto> {}

@Injectable(as: MonedaCacheDataSource)
class MonedaCacheDataSourceImpl extends GenericCacheDataSourceImpl<MonedaDto> implements MonedaCacheDataSource {

  MonedaCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'MONEDA';
  }

  @override
  Future<MonedaDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson =
    await super.getLastEntityAsMap();
    return Future.value(MonedaDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(MonedaDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
