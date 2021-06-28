import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/subscripcion_remote_data_source.dart';
import 'package:plataforma_app/features/data/mappers/model/subscripcion_model_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/subscripcion_dto.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';
import 'package:plataforma_app/features/domain/repositories/subscripcion_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_crud_repository_impl.dart';

@Injectable(as: SubscripcionRepository)
class SubscripcionRepositoryImpl extends GenericCrudRepositoryImpl<Subscripcion> implements SubscripcionRepository {
  SubscripcionRepositoryImpl({
    @required SubscripcionRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(remoteCrudDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Map<String, dynamic> getEntityAsJson(Subscripcion entity) {
    final SubscripcionDto modelSubscripcion = SubscripcionDtoMapper.mapEntityToDto(entity);
    return modelSubscripcion.toJson();
  }

  @override
  dynamic mapEntityToDto(Subscripcion entity) {
    return SubscripcionDtoMapper.mapEntityToDto(entity);
  }

  @override
  Subscripcion mapDtoToEntity(dynamic model) {
    return SubscripcionDtoMapper.mapDtoToEntity(model as SubscripcionDto);
  }
}
