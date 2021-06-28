import 'package:intl/intl.dart';

const String fechaSinHora = 'dd/MM/yyyy';
const String fechaSinMicroSegundos = 'dd/MM/yyyy HH:mm:ss';

class DateUtils {
  static String dateToString(DateTime dateTime) {
    return "${dateTime.toLocal()}".split(' ')[0];
  }

  static String dateToStringSinHora(DateTime dateTime) {
    return DateFormat(fechaSinHora).format(dateTime.toLocal());
  }

  static DateTime dateTimeWithoutMicroseconds(DateTime dateTime) {
    final String strDateTime = DateFormat(fechaSinMicroSegundos).format(dateTime.toLocal());
    return DateFormat(fechaSinMicroSegundos).parse(strDateTime);
  }
}
