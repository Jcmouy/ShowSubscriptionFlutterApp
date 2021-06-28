import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/error/exceptions.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/account_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/shared/dio_utils.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;
import 'package:plataforma_app/features/data/models/remote/usuario_account_dto.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_account_change_password_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';

abstract class AccountRemoteDataSource {
  Future<void> registerUser(UsuarioAccountDto usuarioAccountDto);
  Future<bool> changePassword(UsuarioAccountChangePasswordDto usuarioAccountChangePasswordDto);
}

@Injectable(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final AuthorizationRepository authorizationRepository;

  AccountRemoteDataSourceImpl({@required this.authorizationRepository});

  @override
  Future<void> registerUser(UsuarioAccountDto usuarioAccountDto) async {
    try {
      final client = AccountRemoteClient(Dio(DioUtils.getCommonBaseOptions()));
      await client.registerUser(usuarioAccountDto);
      return;
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<bool> changePassword(UsuarioAccountChangePasswordDto usuarioAccountChangePasswordDto) async {
    try {
      final String token = await authorizationRepository.getAuthorizationTokenApp();
      final client = AccountRemoteClient(Dio(DioUtils.getCommonBaseOptionsWithToken(token)));
      await client.changePassword(usuarioAccountChangePasswordDto);
      return true;
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return false;
  }

  void handleError(Response response) {
    if (response.statusCode == 400) {
      throw ClientException.defaultMessage();
    }
    if (response.statusCode == 401) {
      throw SecurityException.unauthorizedMessage();
    }
    if (response.statusCode == 403) {
      throw SecurityException.forbiddenMessage();
    }
    if (response.statusCode == 404) {
      throw BadRequestException();
    }
    throw ServerException(constants.FailureMessages.serverFailureMessage);
  }
}
