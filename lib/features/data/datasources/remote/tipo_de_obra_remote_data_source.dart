import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/tipo_de_obra_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/tipo_de_obra_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class TipoDeObraRemoteDataSource extends GenericRemoteDataSource<TipoDeObraDto> {}

@Injectable(as: TipoDeObraRemoteDataSource)
class TipoDeObraRemoteDataSourceImpl implements TipoDeObraRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final TipoDeObraRemoteClient tipoDeObraRemoteClient;

  TipoDeObraRemoteDataSourceImpl({@required this.authorizationRepository, @required this.tipoDeObraRemoteClient});

  @override
  Future<TipoDeObraDto> getEntityById(int id) async {
    try {
      return tipoDeObraRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<TipoDeObraDto>> getAllEntities() async {
    try {
      return tipoDeObraRemoteClient.getAllEntities();
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
      return tipoDeObraRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
