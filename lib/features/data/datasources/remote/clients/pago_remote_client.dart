import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_crud_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/pago_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'pago_remote_client.g.dart';

@injectable
@RestApi()
abstract class PagoRemoteClient implements GenericCrudRemoteClient<PagoDto> {
  @factoryMethod
  factory PagoRemoteClient(Dio dio) = _PagoRemoteClient;

  @override
  @GET("/pagos/{id}")
  Future<PagoDto> getEntityById(@Path("id") int id);

  @override
  @GET("/pagos?{query}")
  Future<List<PagoDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/pagos/count")
  Future<int> countEntities();

  @override
  @POST("/pagos")
  Future<PagoDto> createEntity(@Body() PagoDto entity);

  @override
  @PUT("/pagos")
  Future<PagoDto> updateEntity(PagoDto entity);

  @override
  @DELETE("/pagos?id={id}")
  Future<void> deleteEntityById(int id);

  @override
  @DELETE("/pagos?{jsonKey}")
  Future<void> deleteEntityByKey(String jsonKey);
}
