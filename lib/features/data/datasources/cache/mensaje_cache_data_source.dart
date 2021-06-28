import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/mensaje_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MensajeCacheDataSource
    extends GenericCacheDataSource<MensajeDto> {}

@Injectable(as: MensajeCacheDataSource)
class MensajeCacheDataSourceImpl extends GenericCacheDataSourceImpl<MensajeDto> implements MensajeCacheDataSource {

  MensajeCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'MENSAJE';
  }

  @override
  Future<MensajeDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson =
    await super.getLastEntityAsMap();
    return Future.value(MensajeDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(MensajeDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
