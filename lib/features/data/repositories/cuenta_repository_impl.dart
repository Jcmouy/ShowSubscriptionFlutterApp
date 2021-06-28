import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/cuenta_remote_data_source.dart';
import 'package:plataforma_app/features/domain/entities/cuenta.dart';
import 'package:plataforma_app/features/domain/repositories/cuenta_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: CuentaRepository)
class CuentaRepositoryImpl extends GenericReadonlyRepositoryImpl<Cuenta> implements CuentaRepository {
  CuentaRepositoryImpl({
    @required CuentaRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);
}
