import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/pais_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PaisCacheDataSource
    extends GenericCacheDataSource<PaisDto> {}

@Injectable(as: PaisCacheDataSource)
class PaisCacheDataSourceImpl extends GenericCacheDataSourceImpl<PaisDto> implements PaisCacheDataSource {

  PaisCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'PAIS';
  }

  @override
  Future<PaisDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson =
    await super.getLastEntityAsMap();
    return Future.value(PaisDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(PaisDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
