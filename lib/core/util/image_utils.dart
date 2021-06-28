import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart';

class ImageUtils {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
