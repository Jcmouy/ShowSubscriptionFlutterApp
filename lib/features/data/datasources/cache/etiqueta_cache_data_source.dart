import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/etiqueta_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class EtiquetaCacheDataSource extends GenericCacheDataSource<EtiquetaDto> {}

@Injectable(as: EtiquetaCacheDataSource)
class EtiquetaCacheDataSourceImpl extends GenericCacheDataSourceImpl<EtiquetaDto> implements EtiquetaCacheDataSource {
  EtiquetaCacheDataSourceImpl({@required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'ETIQUETA';
  }

  @override
  Future<EtiquetaDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson = await super.getLastEntityAsMap();
    return Future.value(EtiquetaDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(EtiquetaDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
