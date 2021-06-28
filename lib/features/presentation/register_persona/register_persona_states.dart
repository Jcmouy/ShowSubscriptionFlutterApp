abstract class RegisterPersonaState {
  const RegisterPersonaState();
}

class RegisterPersonaInitial extends RegisterPersonaState {
  const RegisterPersonaInitial();
}

class RegisterPersonaLoading extends RegisterPersonaState {
  const RegisterPersonaLoading();
}

class RegisterPersonaSucess extends RegisterPersonaState {
  const RegisterPersonaSucess();
}

class RegisterPersonaError extends RegisterPersonaState {
  final String message;
  const RegisterPersonaError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RegisterPersonaError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
