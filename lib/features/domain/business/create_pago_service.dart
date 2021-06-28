import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/pago.dart';
import 'package:plataforma_app/features/domain/repositories/pago_repository.dart';

@injectable
class CreatePagoService implements UseCase<Pago, Pago> {
  final PagoRepository repository;

  CreatePagoService(this.repository);

  @override
  Future<Pago> call(Pago params) async {
    return repository.createEntity(params);
  }
}
