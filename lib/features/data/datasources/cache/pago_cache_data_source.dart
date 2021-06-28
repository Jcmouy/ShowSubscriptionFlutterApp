import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/pago_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PagoCacheDataSource extends GenericCacheDataSource<PagoDto> {}

@Injectable(as: PagoCacheDataSource)
class PagoCacheDataSourceImpl extends GenericCacheDataSourceImpl<PagoDto> implements PagoCacheDataSource {
  PagoCacheDataSourceImpl({@required SharedPreferences sharedPreferences}) : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'PAGO';
  }

  @override
  Future<PagoDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson = await super.getLastEntityAsMap();
    return Future.value(PagoDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(PagoDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
