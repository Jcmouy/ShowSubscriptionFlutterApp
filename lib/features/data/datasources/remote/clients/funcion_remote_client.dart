import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/funcion_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'funcion_remote_client.g.dart';

@injectable
@RestApi()
abstract class FuncionRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory FuncionRemoteClient(Dio dio) = _FuncionRemoteClient;

  @override
  @GET("/funciones/{id}")
  Future<FuncionDto> getEntityById(@Path("id") int id);

  @override
  @GET("/funciones?{query}")
  Future<List<FuncionDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/funciones/count")
  Future<int> countEntities();
}
