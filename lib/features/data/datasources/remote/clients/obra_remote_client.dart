import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/obra_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'obra_remote_client.g.dart';

@injectable
@RestApi()
abstract class ObraRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory ObraRemoteClient(Dio dio) = _ObraRemoteClient;

  @override
  @GET("/obras/{id}")
  Future<ObraDto> getEntityById(@Path("id") int id);

  @override
  @GET("/obras?{query}")
  Future<List<ObraDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/obras/count")
  Future<int> countEntities();
}
