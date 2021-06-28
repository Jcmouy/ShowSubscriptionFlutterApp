import 'package:dio/dio.dart';
import 'package:plataforma_app/features/data/datasources/cache/authorization_cache_data_source.dart';
import 'package:plataforma_app/injection.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) {
    final AuthorizationCacheDataSource authorizationCacheDataSource = getIt<AuthorizationCacheDataSource>();
    final String token = authorizationCacheDataSource.getStoredToken();
    options.headers["Authorization"] = "Bearer $token";
    return super.onRequest(options);
  }

  @override
  Future onError(DioError error) {
    if (error.response?.statusCode == 403 || error.response?.statusCode == 401) {
      final RequestOptions options = error.response.request;
      // Invocar al obtener un nuevo token (refreshToken y reintentar)
      refreshToken().then((token) {
        options.headers["Authorization"] = "Bearer $token";
        return _retry(error.request);
      }).catchError((e) {
        return super.onError(error);
      });
      return super.onResponse(error.response);
    } else {
      return super.onError(error);
    }
  }

  Future<String> refreshToken() async {
    return "";
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return getIt<Dio>().request<dynamic>(requestOptions.path,
        data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
  }
}
