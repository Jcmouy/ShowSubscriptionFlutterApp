abstract class ConfirmUserState {
  const ConfirmUserState();
}

class ConfirmUserInitial extends ConfirmUserState {
  const ConfirmUserInitial();
}

class ConfirmUserLoading extends ConfirmUserState {
  const ConfirmUserLoading();
}

class ConfirmUserSucess extends ConfirmUserState {
  const ConfirmUserSucess();
}

class ConfirmUserError extends ConfirmUserState {
  final String message;
  const ConfirmUserError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ConfirmUserError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
