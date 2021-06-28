import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/obra_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/obra_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class ObraRemoteDataSource extends GenericRemoteDataSource<ObraDto> {}

@Injectable(as: ObraRemoteDataSource)
class ObraRemoteDataSourceImpl implements ObraRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final ObraRemoteClient obraRemoteClient;

  ObraRemoteDataSourceImpl({@required this.authorizationRepository, @required this.obraRemoteClient});

  @override
  Future<ObraDto> getEntityById(int id) async {
    try {
      return obraRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<ObraDto>> getAllEntities() async {
    try {
      return obraRemoteClient.getAllEntities();
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
      return obraRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
