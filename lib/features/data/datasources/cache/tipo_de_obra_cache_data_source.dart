import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/tipo_de_obra_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TipoDeObraCacheDataSource extends GenericCacheDataSource<TipoDeObraDto> {}

@Injectable(as: TipoDeObraCacheDataSource)
class TipoDeObraCacheDataSourceImpl extends GenericCacheDataSourceImpl<TipoDeObraDto> implements TipoDeObraCacheDataSource {
  TipoDeObraCacheDataSourceImpl({@required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'TIPO_DE_OBRA';
  }

  @override
  Future<TipoDeObraDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson = await super.getLastEntityAsMap();
    return Future.value(TipoDeObraDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(TipoDeObraDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
