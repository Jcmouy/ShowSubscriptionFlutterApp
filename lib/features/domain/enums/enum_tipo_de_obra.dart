enum EnumTipoDeObra {
  comedia,
  drama,
  ficcion,
  fantasia,
  historica,
}

class EnumTipoDeObraHelper {
  static EnumTipoDeObra getEnumTipoDeObraFromString(String tipoDeObraAsString) {
    for (final EnumTipoDeObra element in EnumTipoDeObra.values) {
      if (element.toString() == tipoDeObraAsString) {
        return element;
      }
    }
    return null;
  }
}
