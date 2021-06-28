import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/login_dto.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';

@injectable
class LoginManualService implements UseCase<String, LoginDto> {
  final AuthorizationRepository repository;

  LoginManualService(this.repository);

  @override
  Future<String> call(LoginDto params) async {
    await repository.clearAuthorizationToken();
    return repository.getAuthorizationTokenOf(params.login, params.password);
  }
}
