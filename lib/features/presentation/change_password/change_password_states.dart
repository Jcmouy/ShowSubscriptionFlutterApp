abstract class ChangePasswordState {
  const ChangePasswordState();
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial();
}

class ChangePasswordLoading extends ChangePasswordState {
  const ChangePasswordLoading();
}

class ChangePasswordSuccess extends ChangePasswordState {
  final String title;
  final String message;

  const ChangePasswordSuccess(this.title, this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChangePasswordSuccess && o.title == title && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class ChangePasswordError extends ChangePasswordState {
  final String message;
  const ChangePasswordError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChangePasswordError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
