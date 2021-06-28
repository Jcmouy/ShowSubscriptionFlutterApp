import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:plataforma_app/features/domain/repositories/obra_repository.dart';

@injectable
class GetObrasService implements UseCase<List<Obra>, NoParams> {
  final ObraRepository repository;

  GetObrasService(this.repository);

  @override
  Future<List<Obra>> call(NoParams params) async {
    return repository.getAllEntidades();
  }
}

@injectable
class GetObraByIdService implements UseCase<Obra, int> {
  final ObraRepository repository;

  GetObraByIdService(this.repository);

  @override
  Future<Obra> call(int obraId) async {
    return repository.getEntidadById(obraId);
  }
}
