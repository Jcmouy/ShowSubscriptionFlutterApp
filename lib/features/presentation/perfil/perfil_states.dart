abstract class PerfilState {
  const PerfilState();
}

class PerfilInitial extends PerfilState {
  const PerfilInitial();
}

class PerfilLoading extends PerfilState {
  const PerfilLoading();
}

class PerfilLoaded extends PerfilState {
  const PerfilLoaded();
}

class PerfilError extends PerfilState {
  final String message;
  const PerfilError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PerfilError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
