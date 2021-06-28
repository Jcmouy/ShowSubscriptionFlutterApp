import 'package:dio/dio.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_account_change_password_dto.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_account_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'account_remote_client.g.dart';

@RestApi()
abstract class AccountRemoteClient {
  factory AccountRemoteClient(Dio dio, {String baseUrl}) = _AccountRemoteClient;

  @POST("/register")
  Future<void> registerUser(@Body() UsuarioAccountDto usuarioAccountDto);

  @POST("/account/change-password")
  Future<void> changePassword(@Body() UsuarioAccountChangePasswordDto usuarioAccountChangePasswordDto);
}
