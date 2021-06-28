import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/pais_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/pais_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';
import 'package:plataforma_app/shared/data/datasources/generic_remote_data_source.dart';

abstract class PaisRemoteDataSource extends GenericRemoteDataSource<PaisDto> {}

@Injectable(as: PaisRemoteDataSource)
class PaisRemoteDataSourceImpl implements PaisRemoteDataSource {
  final AuthorizationRepository authorizationRepository;
  final PaisRemoteClient paisRemoteClient;

  PaisRemoteDataSourceImpl({@required this.authorizationRepository, @required this.paisRemoteClient});

  @override
  Future<PaisDto> getEntityById(int id) async {
    try {
      return paisRemoteClient.getEntityById(id);
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<PaisDto>> getAllEntities() async {
    try {
      return paisRemoteClient.getAllEntities();
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
      return paisRemoteClient.countEntities();
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return 0;
  }
}
