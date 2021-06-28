import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/authorization_remote_client.dart';
import 'package:plataforma_app/features/data/interceptors/remote/custom_api_error_handler.dart';
import 'package:plataforma_app/features/data/models/remote/user_credentials_dto.dart';
import 'package:plataforma_app/features/data/models/remote/user_token_dto.dart';
import 'package:plataforma_app/shared/dio_utils.dart';

abstract class AuthorizationRemoteDataSource {
  Future<String> authenticateWithUserCredentials(String password, String username);
}

@Injectable(as: AuthorizationRemoteDataSource)
class AuthorizationRemoteDataSourceImpl implements AuthorizationRemoteDataSource {
  AuthorizationRemoteDataSourceImpl();

  @override
  Future<String> authenticateWithUserCredentials(String password, String username) async {
    try {
      final UserCredentialsDto credenciales = UserCredentialsDto(password: password, username: username, rememberMe: false);

      final client = AuthorizationRemoteClient(Dio(DioUtils.getCommonBaseOptions()));
      final UserTokenDto tokenDto = await client.authenticateWithUserCredentials(credenciales);

      return tokenDto.idToken;
    } on DioError catch (e) {
      CustomApiErrorHandler.mapDioErrorToApiException(e);
    } catch (error) {
      rethrow;
    }
    return '';
  }
}
