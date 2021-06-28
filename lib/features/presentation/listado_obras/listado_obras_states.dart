abstract class ListadoObrasState {
  const ListadoObrasState();
}

class ListadoObrasInitial extends ListadoObrasState {
  const ListadoObrasInitial();
}

class ListadoObrasLoading extends ListadoObrasState {
  const ListadoObrasLoading();
}

class ListadoObrasLoaded extends ListadoObrasState {
  const ListadoObrasLoaded();
}

class ListadoObrasError extends ListadoObrasState {
  final String message;
  const ListadoObrasError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListadoObrasError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
