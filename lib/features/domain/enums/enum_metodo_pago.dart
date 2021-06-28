enum EnumMetodoPago {
  TICKETERA,
  APPLEPAY,
  GOOGLEPAY,
}

class EnumMetodoPagoHelper {
  static EnumMetodoPago getEnumTipoDeObraFromString(String metodoPagoAsString) {
    for (final EnumMetodoPago element in EnumMetodoPago.values) {
      if (element.toString() == metodoPagoAsString) {
        return element;
      }
    }
    return null;
  }
}
