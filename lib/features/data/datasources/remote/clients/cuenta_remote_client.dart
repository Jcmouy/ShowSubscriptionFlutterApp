import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/cuenta_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'cuenta_remote_client.g.dart';

@injectable
@RestApi()
abstract class CuentaRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory CuentaRemoteClient(Dio dio) = _CuentaRemoteClient;

  @override
  @GET("/cuentas/{id}")
  Future<CuentaDto> getEntityById(@Path("id") int id);

  @override
  @GET("/cuentas?{query}")
  Future<List<CuentaDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/cuentas/count")
  Future<int> countEntities();
}
