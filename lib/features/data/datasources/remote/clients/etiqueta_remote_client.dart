import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/etiqueta_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'etiqueta_remote_client.g.dart';

@injectable
@RestApi()
abstract class EtiquetaRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory EtiquetaRemoteClient(Dio dio) = _EtiquetaRemoteClient;

  @override
  @GET("/etiquetas/{id}")
  Future<EtiquetaDto> getEntityById(@Path("id") int id);

  @override
  @GET("/etiquetas?{query}")
  Future<List<EtiquetaDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/etiquetas/count")
  Future<int> countEntities();
}
