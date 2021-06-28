import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;

class DioUtils {
  static BaseOptions getCommonBaseOptions() {
    return BaseOptions(
      baseUrl: DotEnv().env[constants.ApiConstants.apiBaseUrlVarEnvKey],
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  static BaseOptions getCommonBaseOptionsWithToken(String token) {
    return BaseOptions(
      baseUrl: DotEnv().env[constants.ApiConstants.apiBaseUrlVarEnvKey],
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}
