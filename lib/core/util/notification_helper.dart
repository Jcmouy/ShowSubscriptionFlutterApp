import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:plataforma_app/core/helpers/timezone_location_helper.dart';
import 'package:rxdart/subjects.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:plataforma_app/core/util/text_utils.dart';

final BehaviorSubject<ReminderNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReminderNotification>();

final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

Future<void> initNotifications(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  const initializationSettingsAndroid = AndroidInitializationSettings('theater_logo');
  final initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReminderNotification(id: id, title: title, body: body, payload: payload));
      });
  final initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    selectNotificationSubject.add(payload);
  });
}

Future<void> showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  //Es posible que si se cambia cualquiera de los valores de pref vinculado a notificaciones sea necesario cambiar el channel
  String channelId;
  if (prefs.getNotificationChannelId() == null || prefs.getNotificationChannelChanged()) {
    channelId = TextUtils.randomString(4);
    prefs.setNotificationChannelId(channelId);
    prefs.setNotificationChannelChanged(notificationChannelChanged: false);
  } else if (!prefs.getNotificationChannelChanged()) {
    channelId = prefs.getNotificationChannelId();
  }

  final androidPlatformChannelSpecifics = AndroidNotificationDetails('Channel ID$channelId', 'Experience', 'ChannelForExperienceApp',
      playSound: prefs.getSoundNotification(),
      enableVibration: prefs.getVibrationNotification(),
      importance: prefs.getNotificationPriority() ? Importance.max : Importance.min,
      priority: prefs.getNotificationPriority() ? Priority.high : Priority.low,
      ticker: 'ticker');
  final iOSPlatformChannelSpecifics = IOSNotificationDetails(
    presentSound: prefs.getSoundNotification(),
    presentBadge: prefs.getNotificationPriority(),
    presentAlert: prefs.getNotificationPriority(),
  );
  final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(0, 'Experience title', 'plain body', platformChannelSpecifics, payload: 'item x');
}

Future<void> turnOffNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  await flutterLocalNotificationsPlugin.cancelAll();
}

Future<void> turnOffNotificationById(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, num id) async {
  await flutterLocalNotificationsPlugin.cancel(id as int);
}

Future<void> scheduleNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, String id, String body, DateTime scheduledNotificationDateTime) async {
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    id,
    'Reminder notifications',
    'Remember about it',
    icon: 'app_icon',
  );
  const iOSPlatformChannelSpecifics = IOSNotificationDetails();
  final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

  final scheduledDate = await TimeZoneAndLocationHelper.mapDateTimeToTimeZoneDateTime(scheduledNotificationDateTime);

  await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Reminder', body, scheduledDate, platformChannelSpecifics,
      androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
}

Future<void> scheduleNotificationPeriodically(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, String id, String body, RepeatInterval interval) async {
  final androidPlatformChannelSpecifics = AndroidNotificationDetails(
    id,
    'Reminder notifications',
    'Remember about it',
    icon: 'smile_icon',
  );
  const iOSPlatformChannelSpecifics = IOSNotificationDetails();
  final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.periodicallyShow(0, 'Reminder', body, interval, platformChannelSpecifics);
}

void requestIOSPermissions(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
}

class ReminderNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReminderNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
