import 'dart:math';

const int maxDescriptionLength = 200;

class TextUtils {
  static const shortTitleLength = 18;
  static const shortDescriptionLength = 50;
  static const longDescriptionLength = 200;

  static String truncateWithEllipsis(String myString) {
    return truncateWithEllipsisOn(maxDescriptionLength, myString);
  }

  static String truncateWithEllipsisOn(int cutoff, String myString) {
    return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
  }

  static String randomString(int length) {
    final rand = Random();
    final codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return String.fromCharCodes(codeUnits);
  }
}
