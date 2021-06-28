import 'package:injectable/injectable.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/domain/repositories/usuario_repository.dart';

@injectable
class GetUsuarioService implements UseCase<Usuario, int> {
  final UsuarioRepository repository;

  GetUsuarioService(this.repository);

  @override
  Future<Usuario> call(int params) async {
    return repository.getEntidadById(params);
  }
}
