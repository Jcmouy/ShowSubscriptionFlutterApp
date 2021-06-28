abstract class CarteleraState {
  const CarteleraState();
}

class CarteleraInitial extends CarteleraState {
  const CarteleraInitial();
}

class CarteleraLoading extends CarteleraState {
  const CarteleraLoading();
}

class CarteleraLoaded extends CarteleraState {
  const CarteleraLoaded();
}

class CarteleraSuccess extends CarteleraState {
  final String title;
  final String message;

  const CarteleraSuccess(this.title, this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CarteleraSuccess && o.title == title && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class CarteleraError extends CarteleraState {
  final String message;
  const CarteleraError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CarteleraError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
