import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/cuenta_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CuentaCacheDataSource extends GenericCacheDataSource<CuentaDto> {}

@Injectable(as: CuentaCacheDataSource)
class CuentaCacheDataSourceImpl extends GenericCacheDataSourceImpl<CuentaDto> implements CuentaCacheDataSource {
  CuentaCacheDataSourceImpl({@required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'CUENTA';
  }

  @override
  Future<CuentaDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson = await super.getLastEntityAsMap();
    return Future.value(CuentaDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(CuentaDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
