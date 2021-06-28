import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/models/remote/persona_dto.dart';
import 'package:plataforma_app/shared/data/datasources/generic_cache_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonaCacheDataSource
    extends GenericCacheDataSource<PersonaDto> {}

@Injectable(as: PersonaCacheDataSource)
class PersonaCacheDataSourceImpl extends GenericCacheDataSourceImpl<PersonaDto> implements PersonaCacheDataSource {

  PersonaCacheDataSourceImpl({@required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);

  @override
  String getEntityName() {
    return 'PERSONA';
  }

  @override
  Future<PersonaDto> getLastEntity() async {
    final Map<String, dynamic> entityAsJson =
    await super.getLastEntityAsMap();
    return Future.value(PersonaDto.fromJson(entityAsJson));
  }

  @override
  Future<void> cacheEntity(PersonaDto entidad) async {
    return super.cacheEntityAsJson(entidad.toJson());
  }
}
