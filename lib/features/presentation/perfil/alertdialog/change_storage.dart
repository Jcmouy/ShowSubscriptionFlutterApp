import 'package:flutter/material.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'options_menu.dart';

final changeStorageProvider = ChangeNotifierProvider((ref) => ChangeStorage());

class ChangeStorage extends ChangeNotifier {
  String _currentStorage;

  ChangeStorage() {
    loadFromPrefs();
  }

  String get currentStorage => _currentStorage;

  void updateStorage(String value) {
    if (value != _currentStorage) {
      _currentStorage = value;
      prefs.setStorage(_currentStorage);
      notifyListeners();
    }
  }

  void loadFromPrefs() {
    _currentStorage = prefs.getStorage();
    if (_currentStorage.isEmpty) {
      _currentStorage = OptionsMenu().storage[0];
    }
    notifyListeners();
  }
}
