import 'package:plataforma_app/features/domain/entities/usuario.dart';

class SocialUsuario extends Usuario {
  final String socialToken;

  const SocialUsuario(
      {int id,
      String login,
      String firstName,
      String lastName,
      String email,
      String imagenPath,
      bool activated,
      String langKey,
      String createdBy,
      DateTime createdDate,
      String lastModifiedBy,
      DateTime lastModifiedDate,
      String password,
      Set<String> authorities,
      this.socialToken})
      : super(
            id: id,
            login: login,
            firstName: firstName,
            lastName: lastName,
            email: email,
            imagenPath: imagenPath,
            activated: activated,
            langKey: langKey,
            createdBy: createdBy,
            createdDate: createdDate,
            lastModifiedBy: lastModifiedBy,
            lastModifiedDate: lastModifiedDate,
            password: password,
            authorities: authorities);
}
