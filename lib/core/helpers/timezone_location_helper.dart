import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart' as t;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class TimeZoneAndLocationHelper {
  static Future<t.TZDateTime> mapDateTimeToTimeZoneDateTime(DateTime dateTime) async {
    // Find the 'current location'
    final location = await getCurrentLocation();
    return t.TZDateTime.from(dateTime, location);
  }

  static Future<t.Location> getCurrentLocation() async {
    final timeZone = TimeZone();
    // The device's timezone.
    final String timeZoneName = await timeZone.getTimeZoneName();
    // Find the 'current location'
    return timeZone.getLocation(timeZoneName);
  }
}

class TimeZone {
  factory TimeZone() => _this ?? TimeZone._();

  TimeZone._() {
    initializeTimeZones();
  }
  static TimeZone _this;

  Future<String> getTimeZoneName() async => FlutterNativeTimezone.getLocalTimezone();

  Future<t.Location> getLocation([String timeZoneNameReceived]) async {
    String timeZoneName = timeZoneNameReceived;
    if (timeZoneName == null || timeZoneName.isEmpty) {
      timeZoneName = await getTimeZoneName();
    }
    return t.getLocation(timeZoneName);
  }
}
