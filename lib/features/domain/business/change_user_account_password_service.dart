import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/password_usuario.dart';
import 'package:plataforma_app/features/domain/repositories/usuario_repository.dart';

@injectable
class ChangeUserAccountPasswordService implements UseCase<bool, PasswordUsuario> {
  final UsuarioRepository repository;

  ChangeUserAccountPasswordService(this.repository);

  @override
  Future<bool> call(PasswordUsuario passwordUsuario) async {
    return repository.changeUserAccountPassword(passwordUsuario);
  }
}
