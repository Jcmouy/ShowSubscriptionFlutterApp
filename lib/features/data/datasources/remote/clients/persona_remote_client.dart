import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_crud_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/persona_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'persona_remote_client.g.dart';

@injectable
@RestApi()
abstract class PersonaRemoteClient implements GenericCrudRemoteClient<PersonaDto> {
  @factoryMethod
  factory PersonaRemoteClient(Dio dio) = _PersonaRemoteClient;

  @override
  @GET("/personas/{id}")
  Future<PersonaDto> getEntityById(@Path("id") int id);

  @override
  @GET("/personas?{query}")
  Future<List<PersonaDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/personas/count")
  Future<int> countEntities();

  @override
  @POST("/personas")
  Future<PersonaDto> createEntity(@Body() PersonaDto entity);

  @override
  @PUT("/personas")
  Future<PersonaDto> updateEntity(@Body() PersonaDto entity);

  @override
  @DELETE("/personas?id={id}")
  Future<void> deleteEntityById(@Path("id") int id);

  @override
  @DELETE("/personas?{jsonKey}")
  Future<void> deleteEntityByKey(@Path("jsonKey") String jsonKey);
}
