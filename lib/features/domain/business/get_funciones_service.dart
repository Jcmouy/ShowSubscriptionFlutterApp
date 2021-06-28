import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/funcion.dart';
import 'package:plataforma_app/features/domain/repositories/funcion_repository.dart';

@injectable
class GetFuncionesService implements UseCase<List<Funcion>, NoParams> {
  final FuncionRepository repository;

  GetFuncionesService(this.repository);

  @override
  Future<List<Funcion>> call(NoParams params) async {
    return repository.getAllEntidades();
  }
}
