import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/mensaje_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'mensaje_remote_client.g.dart';

@injectable
@RestApi()
abstract class MensajeRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory MensajeRemoteClient(Dio dio) = _MensajeRemoteClient;

  @override
  @GET("/mensajes/{id}")
  Future<MensajeDto> getEntityById(@Path("id") int id);

  @override
  @GET("/mensajes?{query}")
  Future<List<MensajeDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/mensajes/count")
  Future<int> countEntities();
}
