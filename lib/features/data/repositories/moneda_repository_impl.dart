import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/moneda_remote_data_source.dart';
import 'package:plataforma_app/features/domain/entities/moneda.dart';
import 'package:plataforma_app/features/domain/repositories/moneda_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: MonedaRepository)
class MonedaRepositoryImpl extends GenericReadonlyRepositoryImpl<Moneda> implements MonedaRepository {
  MonedaRepositoryImpl({
    @required MonedaRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);
}
