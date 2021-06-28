import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/moneda_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'moneda_remote_client.g.dart';

@injectable
@RestApi()
abstract class MonedaRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory MonedaRemoteClient(Dio dio) = _MonedaRemoteClient;

  @override
  @GET("/monedas/{id}")
  Future<MonedaDto> getEntityById(@Path("id") int id);

  @override
  @GET("/monedas?{query}")
  Future<List<MonedaDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/monedas/count")
  Future<int> countEntities();
}
