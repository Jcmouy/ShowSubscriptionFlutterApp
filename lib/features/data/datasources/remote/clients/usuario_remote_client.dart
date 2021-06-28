import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_crud_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/usuario_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'usuario_remote_client.g.dart';

@injectable
@RestApi()
abstract class UsuarioRemoteClient implements GenericCrudRemoteClient<UsuarioDto> {
  @factoryMethod
  factory UsuarioRemoteClient(Dio dio) = _UsuarioRemoteClient;

  @override
  @GET("/users/{id}")
  Future<UsuarioDto> getEntityById(@Path("id") int id);

  @override
  @GET("/users?{query}")
  Future<List<UsuarioDto>> getAllEntities({@Path("query") String query});

  @GET("/users/{login}")
  Future<UsuarioDto> getEntityByLogin(@Path("login") String login);

  @override
  @GET("/users/count")
  Future<int> countEntities();

  @override
  @POST("/users")
  Future<UsuarioDto> createEntity(@Body() UsuarioDto entity);

  @override
  @PUT("/users")
  Future<UsuarioDto> updateEntity(@Body() UsuarioDto entity);

  @override
  @DELETE("/users?id={id}")
  Future<void> deleteEntityById(@Path("id") int id);

  @override
  @DELETE("/users?{jsonKey}")
  Future<void> deleteEntityByKey(@Path("jsonKey") String jsonKey);
}
