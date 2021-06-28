import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/core/util/notification_helper.dart';
import 'package:plataforma_app/injection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/features/presentation/splashscreen_page.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;
final globalScaffoldKey = GlobalKey<ScaffoldState>();

Future<void> runExperienceApp() async {
  if (checkIsInRelease()) {
    debugPrint = (String message, {int wrapWidth}) {};
  }
  _configureFlutterErrorHandling();
  await _initialize();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

void _configureFlutterErrorHandling() {
// This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) {
    if (checkIsInRelease()) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    } else {
      // In development mode, simply print to console.
      FlutterError.dumpErrorToConsole(details);
    }
  };
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Env.dev);
  await prefs.init();

  //Notificaciones
  notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
  requestIOSPermissions(flutterLocalNotificationsPlugin);
}

bool checkIsInRelease() {
  bool isInRelease = true;
  assert(() {
    isInRelease = false;
    return true;
  }());
  return isInRelease;
}

void checkLocalePref() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        final Locale locale = locales.elementAt(0);
        for (var i = 0; i < supportedLocales.length; i++) {
          if (prefs.getLanguage() == supportedLocales.elementAt(i).countryCode) {
            S.load(supportedLocales.elementAt(i));
            return supportedLocales.elementAt(i);
          }
        }
        //Valor por defecto
        return locale ?? const Locale('en', 'US');
      },
      supportedLocales: S.delegate.supportedLocales,
      home: SplashScreenPage(),
    );
  }
}
