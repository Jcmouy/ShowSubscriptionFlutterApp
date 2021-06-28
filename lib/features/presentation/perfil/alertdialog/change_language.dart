import 'package:flutter/material.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'options_menu.dart';

final changeLanguageProvider = ChangeNotifierProvider.family<ChangeLanguage, BuildContext>((ref, context) => ChangeLanguage(context));

class ChangeLanguage extends ChangeNotifier {
  String _currentLanguage;
  String get currentLanguage => _currentLanguage;

  ChangeLanguage(BuildContext context) {
    loadFromPrefs(context);
  }

  void updateLanguage(String value) {
    if (value != _currentLanguage) {
      _currentLanguage = value;
      final Locale selectedLoc = getSelectedLocale(_currentLanguage);
      S.load(selectedLoc);
      prefs.setLanguage(selectedLoc.countryCode);
      notifyListeners();
    }
  }

  void loadFromPrefs(BuildContext context) {
    _currentLanguage = prefs.getLanguage();
    if (_currentLanguage.isEmpty) {
      final Locale currentLocale = Localizations.localeOf(context);
      getNameCurrentLocale(currentLocale.countryCode);
    } else {
      getNameCurrentLocale(_currentLanguage);
    }
  }

  Locale getSelectedLocale(String valueLanguage) {
    Locale selectedLoc;
    if (valueLanguage == S.current.profile_alert_dialog_option_language_en) {
      selectedLoc = const AppLocalizationDelegate().supportedLocales.elementAt(0);
    } else if (valueLanguage == S.current.profile_alert_dialog_option_language_sp) {
      selectedLoc = const AppLocalizationDelegate().supportedLocales.elementAt(1);
    }
    return selectedLoc;
  }

  void getNameCurrentLocale(String currentCountryCode) {
    if (currentCountryCode == 'UY') {
      _currentLanguage = OptionsMenu().language[0];
    } else if (currentCountryCode == 'US') {
      _currentLanguage = OptionsMenu().language[1];
    }
  }
}
