import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_credentials_dto.g.dart';

@JsonSerializable()
class UserCredentialsDto {
  String password;
  bool rememberMe = false;
  String username;

  UserCredentialsDto({
    @required this.password,
    @required this.username,
    this.rememberMe,
  });

  factory UserCredentialsDto.fromJson(Map<String, dynamic> json) => _$UserCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsDtoToJson(this);
}
