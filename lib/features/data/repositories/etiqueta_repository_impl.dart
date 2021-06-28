import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/etiqueta_remote_data_source.dart';
import 'package:plataforma_app/features/domain/entities/etiqueta.dart';
import 'package:plataforma_app/features/domain/repositories/etiqueta_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: EtiquetaRepository)
class EtiquetaRepositoryImpl extends GenericReadonlyRepositoryImpl<Etiqueta> implements EtiquetaRepository {
  EtiquetaRepositoryImpl({
    @required EtiquetaRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);
}
