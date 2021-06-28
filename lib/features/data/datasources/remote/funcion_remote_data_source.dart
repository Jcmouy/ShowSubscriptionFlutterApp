import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/funcion_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/funcion_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class FuncionRemoteDataSource extends GenericRemoteDataSource<FuncionDto> {}

@Injectable(as: FuncionRemoteDataSource)
class FuncionRemoteDataSourceImpl implements FuncionRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final FuncionRemoteClient funcionRemoteClient;

  FuncionRemoteDataSourceImpl({@required this.authorizationRepository, @required this.funcionRemoteClient});

  @override
  Future<FuncionDto> getEntityById(int id) async {
    try {
      return funcionRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<FuncionDto>> getAllEntities() async {
    try {
      return funcionRemoteClient.getAllEntities();
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
      return funcionRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
