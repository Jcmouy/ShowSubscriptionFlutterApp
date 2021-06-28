import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';
import 'package:plataforma_app/features/domain/repositories/subscripcion_repository.dart';

@injectable
class GetSubscripcionesService implements UseCase<List<Subscripcion>, NoParams> {
  final SubscripcionRepository repository;

  GetSubscripcionesService(this.repository);

  @override
  Future<List<Subscripcion>> call(NoParams params) async {
    return repository.getAllEntidades();
  }
}
