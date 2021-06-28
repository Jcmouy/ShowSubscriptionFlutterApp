import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/remote/clients/generic_readonly_remote_client.dart';
import 'package:plataforma_app/features/data/models/remote/tipo_de_obra_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'tipo_de_obra_remote_client.g.dart';

@injectable
@RestApi()
abstract class TipoDeObraRemoteClient implements GenericReadOnlyRemoteClient {
  @factoryMethod
  factory TipoDeObraRemoteClient(Dio dio) = _TipoDeObraRemoteClient;

  @override
  @GET("/tipo-de-obras/{id}")
  Future<TipoDeObraDto> getEntityById(@Path("id") int id);

  @override
  @GET("/tipo-de-obras?{query}")
  Future<List<TipoDeObraDto>> getAllEntities({@Path("query") String query});

  @override
  @GET("/tipo-de-obras/count")
  Future<int> countEntities();
}
