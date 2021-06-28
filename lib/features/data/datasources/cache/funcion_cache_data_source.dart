import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/funcion_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FuncionCacheDataSource extends GenericCacheDataSource<FuncionDto> {}

@Injectable(as: FuncionCacheDataSource)
class FuncionCacheDataSourceImpl extends GenericCacheDataSourceImpl<FuncionDto> implements FuncionCacheDataSource {
  FuncionCacheDataSourceImpl({@required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'FUNCION';
  }

  @override
  Future<FuncionDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson = await super.getLastEntityAsMap();
    return Future.value(FuncionDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(FuncionDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
