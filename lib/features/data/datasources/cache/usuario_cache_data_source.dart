import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UsuarioCacheDataSource
    extends GenericCacheDataSource<UsuarioDto> {}

@Injectable(as: UsuarioCacheDataSource)
class UsuarioCacheDataSourceImpl extends GenericCacheDataSourceImpl<UsuarioDto> implements UsuarioCacheDataSource {

  UsuarioCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'USUARIO';
  }

  @override
  Future<UsuarioDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson =
    await super.getLastEntityAsMap();
    return Future.value(UsuarioDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(UsuarioDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
