import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/interceptors/remote/authorization_interceptor.dart';
import 'package:plataforma_app/features/data/interceptors/remote/logging_interceptor.dart';
import 'package:plataforma_app/shared/dio_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureInjection(String environment) => $initGetIt(getIt, environment: environment);

@module
abstract class RegisterExternalModules {
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
  Dio get dio => createDioGlobalInstance();
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
}

Dio createDioGlobalInstance() {
  final Dio dio = Dio(DioUtils.getCommonBaseOptions());
  dio.interceptors.add(LoggingInterceptor());
  dio.interceptors.add(AuthorizationInterceptor());
  return dio;
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
