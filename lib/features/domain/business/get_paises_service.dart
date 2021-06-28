import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';
import 'package:plataforma_app/features/domain/repositories/pais_repository.dart';

@injectable
class GetPaisesService implements UseCase<List<Pais>, NoParams> {
  final PaisRepository repository;

  GetPaisesService(this.repository);

  @override
  Future<List<Pais>> call(NoParams params) async {
    return repository.getAllEntidades();
  }
}
