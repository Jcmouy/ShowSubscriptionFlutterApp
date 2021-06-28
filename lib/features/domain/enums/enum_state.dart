enum EnumState {
  pendiente,
  iniciada,
  finalizada,
  enviada,
}

class EnumStateHelper {
  static EnumState getEnumTipoDeObraFromString(String stateAsString) {
    for (final EnumState element in EnumState.values) {
      if (element.toString() == stateAsString) {
        return element;
      }
    }
    return null;
  }
}
