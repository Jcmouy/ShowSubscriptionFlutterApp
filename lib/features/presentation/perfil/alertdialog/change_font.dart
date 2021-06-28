import 'package:flutter/material.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'options_menu.dart';

final changeFontProvider = ChangeNotifierProvider((ref) => ChangeFont());

class ChangeFont extends ChangeNotifier {
  String _currentFont;

  ChangeFont() {
    loadFromPrefs();
  }

  String get currentFont => _currentFont;
  void updateFont(String value) {
    if (value != _currentFont) {
      _currentFont = value;
      prefs.setFontSize(_currentFont);
      notifyListeners();
    }
  }

  void loadFromPrefs() {
    _currentFont = prefs.getFontSize();
    if (_currentFont.isEmpty) {
      _currentFont = OptionsMenu().font[0];
    }
    notifyListeners();
  }
}
