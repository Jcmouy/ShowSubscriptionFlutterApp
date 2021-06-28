abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSucess extends LoginState {
  const LoginSucess();
}

class LoginConfirmRegistration extends LoginState {
  const LoginConfirmRegistration();
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
