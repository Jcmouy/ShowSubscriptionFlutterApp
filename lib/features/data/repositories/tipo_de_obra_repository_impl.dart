import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/tipo_de_obra_remote_data_source.dart';
import 'package:plataforma_app/features/domain/entities/tipo_de_obra.dart';
import 'package:plataforma_app/features/domain/repositories/tipo_de_obra_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: TipoDeObraRepository)
class TipoDeObraRepositoryImpl extends GenericReadonlyRepositoryImpl<TipoDeObra> implements TipoDeObraRepository {
  TipoDeObraRepositoryImpl({
    @required TipoDeObraRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);
}
