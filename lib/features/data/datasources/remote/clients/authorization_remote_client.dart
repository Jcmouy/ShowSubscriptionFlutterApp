import 'package:dio/dio.dart';
import 'package:plataforma_app/features/data/models/remote/user_credentials_dto.dart';
import 'package:plataforma_app/features/data/models/remote/user_token_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'authorization_remote_client.g.dart';

@RestApi()
abstract class AuthorizationRemoteClient {
  factory AuthorizationRemoteClient(Dio dio, {String baseUrl}) = _AuthorizationRemoteClient;

  @POST("/authenticate")
  Future<UserTokenDto> authenticateWithUserCredentials(@Body() UserCredentialsDto credentials);
}
