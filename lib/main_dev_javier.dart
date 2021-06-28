import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    await loadEnvFile("assets/env/.env_dev_javier");
    runExperienceApp();
  }, (Object error, StackTrace stackTrace) {
    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    _reportError(error, stackTrace);
  });
}

void _reportError(Object error, StackTrace stackTrace) {
  //TODO ver de levantar un endpoint para recibir los errores o de abrir una cuenta en sentry.io
  // ignore: avoid_print
  print(error);
  // ignore: avoid_print
  print(stackTrace);
}

Future<void> loadEnvFile(String path) async {
  await DotEnv().load(path);
}
