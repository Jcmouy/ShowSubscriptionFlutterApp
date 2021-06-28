abstract class RegisterUsuarioState {
  const RegisterUsuarioState();
}

class RegisterUsuarioInitial extends RegisterUsuarioState {
  const RegisterUsuarioInitial();
}

class RegisterUsuarioLoading extends RegisterUsuarioState {
  const RegisterUsuarioLoading();
}

class RegisterUsuarioSucess extends RegisterUsuarioState {
  const RegisterUsuarioSucess();
}

class RegisterUsuarioError extends RegisterUsuarioState {
  final String message;
  const RegisterUsuarioError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RegisterUsuarioError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
