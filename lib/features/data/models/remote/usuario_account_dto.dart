import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'usuario_account_dto.g.dart';

@JsonSerializable()
class UsuarioAccountDto {
  int id;
  String login;
  String firstName;
  String lastName;
  String email;
  String imageUrl;
  bool activated;
  String langKey;
  String createdBy;
  DateTime createdDate;
  String lastModifiedBy;
  DateTime lastModifiedDate;
  String password;
  Set<String> authorities;

  UsuarioAccountDto({
    this.id,
    @required this.login,
    this.firstName,
    this.lastName,
    @required this.email,
    this.imageUrl,
    @required this.activated,
    @required this.langKey,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.password,
    @required this.authorities,
  });

  factory UsuarioAccountDto.fromJson(Map<String, dynamic> json) => _$UsuarioAccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioAccountDtoToJson(this);
}
