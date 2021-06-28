import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';

part 'usuario_dto.g.dart';

@JsonSerializable()
class UsuarioDto extends Usuario {
  const UsuarioDto({
    int id,
    @required String login,
    String password,
    String firstName,
    String lastName,
    @required String email,
    String imagenPath,
    @required bool activated,
    @required String langKey,
    String createdBy,
    DateTime createdDate,
    String lastModifiedBy,
    DateTime lastModifiedDate,
    @required Set<String> authorities,
  }) : super(
            id: id,
            password: password,
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
            authorities: authorities);

  factory UsuarioDto.fromJson(Map<String, dynamic> json) => _$UsuarioDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioDtoToJson(this);
}
