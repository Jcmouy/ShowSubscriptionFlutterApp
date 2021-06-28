import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/mensaje_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/mensaje_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class MensajeRemoteDataSource extends GenericRemoteDataSource<MensajeDto> {}

@Injectable(as: MensajeRemoteDataSource)
class MensajeRemoteDataSourceImpl implements MensajeRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final MensajeRemoteClient mensajeRemoteClient;

  MensajeRemoteDataSourceImpl({@required this.authorizationRepository, @required this.mensajeRemoteClient});

  @override
  Future<MensajeDto> getEntityById(int id) async {
    try {
      return mensajeRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<MensajeDto>> getAllEntities() async {
    try {
      return mensajeRemoteClient.getAllEntities();
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
      return mensajeRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
