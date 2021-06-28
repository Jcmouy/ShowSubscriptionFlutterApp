import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  Future onRequest(RequestOptions options) {
    debugPrint("--> ${options.method} ${options.path}");
    debugPrint("Content type: ${options.contentType}");
    debugPrint("<-- END HTTP");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    debugPrint("<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
    final String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      final int iterations = (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint(response.data.toString());
    }
    debugPrint("<-- END HTTP");

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    debugPrint("<-- Error -->");
    debugPrint(err.error.toString());
    debugPrint(err.message);
    return super.onError(err);
  }
}
