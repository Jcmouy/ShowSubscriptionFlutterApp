import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/pais_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'pais_remote_client.g.dart';

@injectable
@RestApi()
abstract class PaisRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory PaisRemoteClient(Dio dio) = _PaisRemoteClient;

  @override
  @GET("/paises/{id}")
  Future<PaisDto> getEntityById(@Path("id") int id);

  @override
  @GET("/paises?{query}")
  Future<List<PaisDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/paises/count")
  Future<int> countEntities();
}
