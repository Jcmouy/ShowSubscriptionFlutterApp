import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/pago_remote_data_source.dart';
import 'package:plataforma_app/features/data/mappers/model/pago_model_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/pago_dto.dart';
import 'package:plataforma_app/features/domain/entities/pago.dart';
import 'package:plataforma_app/features/domain/repositories/pago_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_crud_repository_impl.dart';

@Injectable(as: PagoRepository)
class PagoRepositoryImpl extends GenericCrudRepositoryImpl<Pago> implements PagoRepository {
  PagoRepositoryImpl({
    @required PagoRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteCrudDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Map<String, dynamic> getEntityAsJson(Pago entity) {
    final PagoDto modelPago = PagoDtoMapper.mapEntityToDto(entity);
    return modelPago.toJson();
  }

  @override
  Future<Pago> createEntity(Pago entity) async {
    PagoDto modelPago = PagoDtoMapper.mapEntityToDto(entity);
    if (modelPago != null) {
      if (await networkInfo.isConnected) {
        modelPago = await (remoteDataSource as PagoRemoteDataSource).createEntity(modelPago);
      }
      return modelPago;
    }
    return null;
  }
}
