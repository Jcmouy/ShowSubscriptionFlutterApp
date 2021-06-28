import 'package:meta/meta.dart';

class LoginDto {
  final String login;
  final String password;

  const LoginDto({
    @required this.login,
    @required this.password,
  });
}
