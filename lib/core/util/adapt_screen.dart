import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AdaptScreen {
  static MediaQueryData mediaQuery;
  static double _width;
  static double _height;
  static double _topbarH;
  static double _botbarH;
  static double _pixelRatio;
  static var _ratio;
  static void initContext(BuildContext context) {
    if (mediaQuery == null) {
      mediaQuery = MediaQuery.of(context);
      _width = mediaQuery.size.width;
      _height = mediaQuery.size.height;
      _topbarH = mediaQuery.padding.top;
      _botbarH = mediaQuery.padding.bottom;
      _pixelRatio = mediaQuery.devicePixelRatio;
    }
  }

  static void init(int number) {
    int uiwidth = number is int ? number : 750;
    _ratio = _width / uiwidth;
  }

  static double px(number) {
    if (!(_ratio is double || _ratio is int)) {
      AdaptScreen.init(750);
    }
    return number * _ratio as double;
  }

  static double onepx() {
    return 1 / _pixelRatio;
  }

  static double screenW() {
    return _width;
  }

  static double screenH() {
    return _height;
  }

  static double padTopH() {
    return _topbarH;
  }

  static double padBotH() {
    return _botbarH;
  }
}