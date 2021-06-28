import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/local/dao_factory.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/obras_dao.dart';
import 'package:plataforma_app/features/data/datasources/remote/obra_remote_data_source.dart';
import 'package:plataforma_app/features/data/mappers/db/obra_db_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/obra_dto.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:plataforma_app/features/domain/repositories/obra_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: ObraRepository)
class ObraRepositoryImpl extends GenericReadonlyRepositoryImpl<Obra> implements ObraRepository {
  final DaoProvider daoProvider;

  ObraRepositoryImpl({
    @required ObraRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
    @required this.daoProvider,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Future<Obra> getEntidadById(int id) async {
    final ObraDao obraDao = daoProvider.getObraDao();
    final Obra obra = ObraDBMapper.mapDBRegisterToEntity(await obraDao.getById(id));
    if (obra != null) {
      return obra;
    } else {
      if (await networkInfo.isConnected) {
        final ObraDto remoteEntity = await remoteDataSource.getEntityById(id) as ObraDto;
        if (remoteEntity != null) {
          obraDao.insertObra(ObraDBMapper.mapEntityToDBRegister(remoteEntity));
        }
        return remoteEntity;
      }
      return null;
    }
  }
}
