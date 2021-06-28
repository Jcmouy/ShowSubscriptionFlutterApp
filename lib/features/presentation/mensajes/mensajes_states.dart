abstract class MensajesState {
  const MensajesState();
}

class MensajesInitial extends MensajesState {
  const MensajesInitial();
}

class MensajesLoading extends MensajesState {
  const MensajesLoading();
}

class MensajesLoaded extends MensajesState {
  const MensajesLoaded();
}

class MensajesError extends MensajesState {
  final String message;
  const MensajesError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MensajesError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
