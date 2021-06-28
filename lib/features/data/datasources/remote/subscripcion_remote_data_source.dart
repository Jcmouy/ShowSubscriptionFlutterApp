import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/subscripcion_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/subscripcion_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class SubscripcionRemoteDataSource extends GenericCrudRemoteDataSource<SubscripcionDto> {}

@Injectable(as: SubscripcionRemoteDataSource)
class SubscripcionRemoteDataSourceImpl implements SubscripcionRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final SubscripcionRemoteClient subscripcionRemoteClient;

  SubscripcionRemoteDataSourceImpl({@required this.authorizationRepository, @required this.subscripcionRemoteClient});

  @override
  Future<SubscripcionDto> getEntityById(int id) async {
    try {
      return subscripcionRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<SubscripcionDto>> getAllEntities() async {
    try {
      return subscripcionRemoteClient.getAllEntities();
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
      return subscripcionRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }

  @override
  Future<SubscripcionDto> createEntity(SubscripcionDto entity) async {
    try {
      return subscripcionRemoteClient.createEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<SubscripcionDto> updateEntity(SubscripcionDto entity) async {
    try {
      return subscripcionRemoteClient.updateEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<void> deleteEntityById(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEntityByKey(String jsonKey) {
    throw UnimplementedError();
  }
}
