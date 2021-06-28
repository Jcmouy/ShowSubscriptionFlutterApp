import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
  final int id;
  final String login;
  final String firstName;
  final String lastName;
  final String email;
  final String imagenPath;
  final bool activated;
  final String langKey;
  final String createdBy;
  final DateTime createdDate;
  final String lastModifiedBy;
  final DateTime lastModifiedDate;
  final String password;
  final Set<String> authorities;

  const Usuario(
      {this.id,
      this.login,
      this.firstName,
      this.lastName,
      this.email,
      this.imagenPath,
      this.activated = false,
      this.langKey,
      this.createdBy,
      this.createdDate,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.password,
      this.authorities});

  @override
  List<Object> get props => [id];
}
