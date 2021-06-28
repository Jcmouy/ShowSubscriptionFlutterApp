import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';
import 'package:plataforma_app/features/domain/repositories/subscripcion_repository.dart';

@injectable
class CreateSubscripcionService implements UseCase<Subscripcion, Subscripcion> {
  final SubscripcionRepository repository;

  CreateSubscripcionService(this.repository);

  @override
  Future<Subscripcion> call(Subscripcion params) async {
    return repository.createEntity(params);
  }
}
