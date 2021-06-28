import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/obra_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ObraCacheDataSource
    extends GenericCacheDataSource<ObraDto> {}

@Injectable(as: ObraCacheDataSource)
class ObraCacheDataSourceImpl extends GenericCacheDataSourceImpl<ObraDto> implements ObraCacheDataSource {

  ObraCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'OBRA';
  }

  @override
  Future<ObraDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson = await super.getLastEntityAsMap();
    return Future.value(ObraDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(ObraDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
