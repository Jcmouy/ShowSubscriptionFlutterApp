import 'package:shared_preferences/shared_preferences.dart';

const prefsAlreadyWelcomed = 'alreadyWelcomed';
const prefsLoadedCountries = 'loadedCountries';
const prefsSelectedLanguage = 'selectedLanguage';
const prefsSelectedStorage = 'selectedStorage';
const prefsSelectedFontSize = 'selectedFontSize';
const prefsSettingsAutomaticDownload = 'settingsAutomaticDownload';
const prefsSettingsNotificationPriority = 'settingsNotificationPriority';
const prefsSettingsSoundNotification = 'settingsSoundNotification';
const prefsSettingsVibrationNotification = 'settingsVibrationNotification';
const prefsNotificationChannelId = 'notificationChannelId';
const prefsNotificationChannelChanged = 'notificationChannelChanged';

class SharedPreferencesHelper {
  static SharedPreferences _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  bool wasAlreadyWelcomed() {
    return _prefs.getBool(prefsAlreadyWelcomed) ?? false;
  }

  void markWelcomed() {
    _prefs.setBool(prefsAlreadyWelcomed, true);
  }

  bool loadedCountries() {
    return _prefs.getBool(prefsLoadedCountries) ?? false;
  }

  void markLoadCountries() {
    _prefs.setBool(prefsLoadedCountries, true);
  }

  String getLanguage() {
    return _prefs.getString(prefsSelectedLanguage) ?? "";
  }

  void setLanguage(String selectedLanguage) {
    _prefs.setString(prefsSelectedLanguage, selectedLanguage);
  }

  String getStorage() {
    return _prefs.getString(prefsSelectedStorage) ?? "";
  }

  void setStorage(String selectedStorage) {
    _prefs.setString(prefsSelectedStorage, selectedStorage);
  }

  String getFontSize() {
    return _prefs.getString(prefsSelectedFontSize) ?? "";
  }

  void setFontSize(String selectedFont) {
    _prefs.setString(prefsSelectedFontSize, selectedFont);
  }

  bool getAutomaticDownload() {
    return _prefs.getBool(prefsSettingsAutomaticDownload) ?? true;
  }

  void setAutomaticDownload({bool automaticDownload}) {
    _prefs.setBool(prefsSettingsAutomaticDownload, automaticDownload);
  }

  bool getNotificationPriority() {
    return _prefs.getBool(prefsSettingsNotificationPriority) ?? true;
  }

  void setNotificationPriority({bool notificationPriority}) {
    setNotificationChannelChanged(notificationChannelChanged: true);
    _prefs.setBool(prefsSettingsNotificationPriority, notificationPriority);
  }

  bool getSoundNotification() {
    return _prefs.getBool(prefsSettingsSoundNotification) ?? false;
  }

  void setSoundNotification({bool soundNotification}) {
    setNotificationChannelChanged(notificationChannelChanged: true);
    _prefs.setBool(prefsSettingsSoundNotification, soundNotification);
  }

  bool getVibrationNotification() {
    return _prefs.getBool(prefsSettingsVibrationNotification) ?? true;
  }

  void setVibrationNotification({bool vibrationNotification}) {
    setNotificationChannelChanged(notificationChannelChanged: true);
    _prefs.setBool(prefsSettingsVibrationNotification, vibrationNotification);
  }

  String getNotificationChannelId() {
    return _prefs.getString(prefsNotificationChannelId) ?? "";
  }

  void setNotificationChannelId(String channelId) {
    _prefs.setString(prefsNotificationChannelId, channelId);
  }

  bool getNotificationChannelChanged() {
    return _prefs.getBool(prefsNotificationChannelChanged) ?? false;
  }

  void setNotificationChannelChanged({bool notificationChannelChanged}) {
    _prefs.setBool(prefsNotificationChannelChanged, notificationChannelChanged);
  }
}

final prefs = SharedPreferencesHelper();
