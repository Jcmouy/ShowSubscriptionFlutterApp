import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/etiqueta_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/etiqueta_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class EtiquetaRemoteDataSource extends GenericRemoteDataSource<EtiquetaDto> {}

@Injectable(as: EtiquetaRemoteDataSource)
class EtiquetaRemoteDataSourceImpl implements EtiquetaRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final EtiquetaRemoteClient etiquetaRemoteClient;

  EtiquetaRemoteDataSourceImpl({@required this.authorizationRepository, @required this.etiquetaRemoteClient});

  @override
  Future<EtiquetaDto> getEntityById(int id) async {
    try {
      return etiquetaRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<EtiquetaDto>> getAllEntities() async {
    try {
      return etiquetaRemoteClient.getAllEntities();
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
      return etiquetaRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
