import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/mensaje_remote_data_source.dart';
import 'package:plataforma_app/features/domain/entities/mensaje.dart';
import 'package:plataforma_app/features/domain/repositories/mensaje_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: MensajeRepository)
class MensajeRepositoryImpl extends GenericReadonlyRepositoryImpl<Mensaje> implements MensajeRepository {
  MensajeRepositoryImpl({
    @required MensajeRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);
}
