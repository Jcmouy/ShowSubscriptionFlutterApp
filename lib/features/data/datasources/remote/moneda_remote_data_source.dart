import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/moneda_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/moneda_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class MonedaRemoteDataSource extends GenericRemoteDataSource<MonedaDto> {}

@Injectable(as: MonedaRemoteDataSource)
class MonedaRemoteDataSourceImpl implements MonedaRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final MonedaRemoteClient monedaRemoteClient;

  MonedaRemoteDataSourceImpl({@required this.authorizationRepository, @required this.monedaRemoteClient});

  @override
  Future<MonedaDto> getEntityById(int id) async {
    try {
      return monedaRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<MonedaDto>> getAllEntities() async {
    try {
      return monedaRemoteClient.getAllEntities();
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
      return monedaRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
