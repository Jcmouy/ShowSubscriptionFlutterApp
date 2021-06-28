import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/core/network/network_info.dart';
import 'package:plataforma_app/features/data/datasources/local/dao_factory.dart';
import 'package:plataforma_app/features/data/datasources/local/daos/funciones_dao.dart';
import 'package:plataforma_app/features/data/datasources/remote/funcion_remote_data_source.dart';
import 'package:plataforma_app/features/data/mappers/db/funcion_db_mapper.dart';
import 'package:plataforma_app/features/data/models/remote/funcion_dto.dart';
import 'package:plataforma_app/features/domain/entities/funcion.dart';
import 'package:plataforma_app/features/domain/repositories/funcion_repository.dart';
import 'package:plataforma_app/shared/data/repositories/generic_readonly_repository_impl.dart';

@Injectable(as: FuncionRepository)
class FuncionRepositoryImpl extends GenericReadonlyRepositoryImpl<Funcion> implements FuncionRepository {
  final DaoProvider daoProvider;

  FuncionRepositoryImpl({
    @required FuncionRemoteDataSource remoteDataSource,
    @required NetworkInfo networkInfo,
    @required this.daoProvider,
  }) : super(remoteDataSource: remoteDataSource, networkInfo: networkInfo);

  @override
  Future<Funcion> getEntidadById(int id) async {
    final FuncionDao funcionDao = daoProvider.getFuncionDao();
    final Funcion funcion = FuncionDBMapper.mapDBRegisterToEntity(await funcionDao.getById(id));
    if (funcion != null) {
      return funcion;
    } else {
      if (await networkInfo.isConnected) {
        final FuncionDto remoteEntity = await remoteDataSource.getEntityById(id) as FuncionDto;
        if (remoteEntity != null) {
          funcionDao.insertFuncion(FuncionDBMapper.mapEntityToDBRegister(remoteEntity));
        }
        return remoteEntity;
      }
      return null;
    }
  }

  @override
  Future<List<Funcion>> getAllEntidades() async {
    final FuncionDao funcionDao = daoProvider.getFuncionDao();
    final List<Funcion> funciones = FuncionDBMapper.mapListDBRegisterToListEntity(await funcionDao.getAll());
    if (funciones != null && funciones.isNotEmpty) {
      return funciones;
    } else {
      if (await networkInfo.isConnected) {
        final List<FuncionDto> remoteEntities = await remoteDataSource.getAllEntities() as List<FuncionDto>;
        if (remoteEntities != null) {
          for (final FuncionDto funcion in remoteEntities) {
            await funcionDao.insertFuncion(FuncionDBMapper.mapEntityToDBRegister(funcion));
          }
        }
        return remoteEntities;
      }
      return null;
    }
  }
}
