import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/persona_remote_data_source.dart';
import 'package:plataforma_app/features/data/mappers/model/persona_model_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/persona_dto.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/repositories/persona_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_crud_repository_impl.dart';
import 'package:plataforma_app/features/data/datasources/local/dao_factory.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/persona_dao.dart';
import 'package:plataforma_app/features/data/mappers/db/persona_db_mapper.dart';

@Injectable(as: PersonaRepository)
class PersonaRepositoryImpl extends GenericCrudRepositoryImpl<Persona> implements PersonaRepository {
  final DaoProvider daoProvider;

  PersonaRepositoryImpl({
    @required PersonaRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
    @required this.daoProvider,
  }) : super(remoteCrudDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Map<String, dynamic> getEntityAsJson(Persona entity) {
    final PersonaDto modelPersona = PersonaDtoMapper.mapEntityToDto(entity);
    return modelPersona.toJson();
  }

  @override
  Future<Persona> createEntity(Persona entity) async {
    PersonaDto modelPersona = PersonaDtoMapper.mapEntityToDto(entity);
    if (modelPersona != null) {
      if (await networkInfo.isConnected) {
        modelPersona = await (remoteDataSource as PersonaRemoteDataSource).createEntity(modelPersona);
        await _insertDBPersona(modelPersona);
      }
      return modelPersona;
    }
    return null;
  }

  Future<PersonaDto> _insertDBPersona(PersonaDto modelPersona) async {
    final PersonaDao personaDao = daoProvider.getPersonaDao();
    if (modelPersona != null) {
      await personaDao.insertPersona(PersonaDBMapper.mapEntityToDBRegister(modelPersona));
      return modelPersona;
    }
    return null;
  }

  @override
  Future<Persona> getEntityByCodigo(String codigo) async {
    final PersonaDao personaDao = daoProvider.getPersonaDao();
    final Persona persona = PersonaDBMapper.mapDBRegisterToEntity(await personaDao.getByCodigo(codigo));
    if (persona != null) {
      return persona;
    } else {
      if (await networkInfo.isConnected) {
        final PersonaDto persona = await (remoteDataSource as PersonaRemoteDataSource).getEntityByCodigo("codigo.equals=$codigo");
        _insertDBPersona(persona);
        return persona;
      }
      return null;
    }
  }

  @override
  dynamic mapEntityToDto(Persona entity) {
    return PersonaDtoMapper.mapEntityToDto(entity);
  }

  @override
  Persona mapDtoToEntity(dynamic model) {
    return PersonaDtoMapper.mapDtoToEntity(model as PersonaDto);
  }
}
