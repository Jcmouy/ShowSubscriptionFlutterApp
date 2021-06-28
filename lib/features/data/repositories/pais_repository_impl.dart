import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/remote/pais_remote_data_source.dart';
import 'package:plataforma_app/features/data/models/remote/pais_dto.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';
import 'package:plataforma_app/features/domain/repositories/pais_repository.dart';
import 'package:plataforma_app/features/data/datasources/local/dao_factory.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/pais_dao.dart';
import 'package:plataforma_app/features/data/mappers/db/pais_db_mapper.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: PaisRepository)
class PaisRepositoryImpl extends GenericReadonlyRepositoryImpl<Pais> implements PaisRepository {
  final DaoProvider daoProvider;

  PaisRepositoryImpl({
    @required PaisRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
    @required this.daoProvider,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Future<Pais> getEntidadById(int id) async {
    final PaisDao paisDao = daoProvider.getPaisDao();
    final Pais pais = PaisDBMapper.mapDBRegisterToEntity(await paisDao.getById(id));
    if (pais != null) {
      return pais;
    } else {
      if (await networkInfo.isConnected) {
        final PaisDto remoteEntity = await remoteDataSource.getEntityById(id) as PaisDto;
        if (remoteEntity != null) {
          paisDao.insertEntity(PaisDBMapper.mapEntityToDBRegister(remoteEntity));
        }
        return remoteEntity;
      }
      return null;
    }
  }
}
