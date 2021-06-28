import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/persona_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/persona_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class PersonaRemoteDataSource extends GenericCrudRemoteDataSource<PersonaDto> {
  Future<PersonaDto> getEntityByCodigo(String codigo);
}

@Injectable(as: PersonaRemoteDataSource)
class PersonaRemoteDataSourceImpl implements PersonaRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final PersonaRemoteClient personaRemoteClient;

  PersonaRemoteDataSourceImpl({@required this.authorizationRepository, @required this.personaRemoteClient});

  @override
  Future<PersonaDto> getEntityById(int id) async {
    try {
      return personaRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<PersonaDto> getEntityByCodigo(String codigo) async {
    try {
      final List<PersonaDto> personas = await personaRemoteClient.getAllEntities(query: codigo);
      if (personas.isNotEmpty) {
        return Future.value(personas[0]);
      }
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return Future.value(PersonaDto.emptyPersona());
  }

  @override
  Future<List<PersonaDto>> getAllEntities() async {
    try {
      return personaRemoteClient.getAllEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return [];
  }

  @override
  Future<int> countEntities() async {
    try {
      return personaRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }

  @override
  Future<PersonaDto> createEntity(PersonaDto entity) async {
    try {
      return personaRemoteClient.createEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<PersonaDto> updateEntity(PersonaDto entity) async {
    try {
      return personaRemoteClient.updateEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<void> deleteEntityById(int id) async {
    try {
      return personaRemoteClient.deleteEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> deleteEntityByKey(String jsonKey) {
    throw UnimplementedError();
  }
}
