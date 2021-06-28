import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/cuenta.dart';
import 'package:plataforma_app/features/domain/repositories/cuenta_repository.dart';

@injectable
class GetCuentasService implements UseCase<List<Cuenta>, NoParams> {
  final CuentaRepository repository;

  GetCuentasService(this.repository);

  @override
  Future<List<Cuenta>> call(NoParams params) async {
    return repository.getAllEntidades();
  }
}
