import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';
import 'package:plataforma_app/features/domain/repositories/pais_repository.dart';

@injectable
class GetPaisService implements UseCase<Pais, int> {
  final PaisRepository repository;

  GetPaisService(this.repository);

  @override
  Future<Pais> call(int params) async {
    return repository.getEntidadById(params);
  }
}
