import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_crud_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/subscripcion_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'subscripcion_remote_client.g.dart';

@injectable
@RestApi()
abstract class SubscripcionRemoteClient implements GenericCrudRemoteClient<SubscripcionDto> {
  @factoryMethod
  factory SubscripcionRemoteClient(Dio dio) = _SubscripcionRemoteClient;

  @override
  @GET("/subscripciones/{id}")
  Future<SubscripcionDto> getEntityById(@Path("id") int id);

  @override
  @GET("/subscripciones?{query}")
  Future<List<SubscripcionDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/subscripciones/count")
  Future<int> countEntities();

  @override
  @POST("/subscripciones")
  Future<SubscripcionDto> createEntity(@Body() SubscripcionDto entity);

  @override
  @PUT("/subscripciones")
  Future<SubscripcionDto> updateEntity(@Body() SubscripcionDto entity);

  @override
  @DELETE("/subscripciones?id={id}")
  Future<void> deleteEntityById(@Path("id") int id);

  @override
  @DELETE("/subscripciones?{jsonKey}")
  Future<void> deleteEntityByKey(@Path("jsonKey") String jsonKey);
}
