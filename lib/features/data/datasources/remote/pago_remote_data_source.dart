import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/pago_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/pago_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class PagoRemoteDataSource extends GenericCrudRemoteDataSource<PagoDto> {}

@Injectable(as: PagoRemoteDataSource)
class PagoRemoteDataSourceImpl implements PagoRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final PagoRemoteClient pagoRemoteClient;

  PagoRemoteDataSourceImpl({@required this.authorizationRepository, @required this.pagoRemoteClient});

  @override
  Future<PagoDto> getEntityById(int id) async {
    try {
      return pagoRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<PagoDto>> getAllEntities() async {
    try {
      return pagoRemoteClient.getAllEntities();
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
      return pagoRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }

  @override
  Future<PagoDto> createEntity(PagoDto entity) async {
    try {
      return pagoRemoteClient.createEntity(entity);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<PagoDto> updateEntity(PagoDto entity) async {
    throw UnimplementedError();
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
