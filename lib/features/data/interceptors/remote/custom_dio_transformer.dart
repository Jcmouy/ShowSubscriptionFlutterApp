import 'dart:async';
import 'package:dio/dio.dart';

/// If the request data is a `List` type, the [DefaultTransformer] will send data
/// by calling its `toString()` method. However, normally the List object is
/// not expected for request data( mostly need Map ). So we provide a custom
/// [Transformer] that will throw error when request data is a `List` type.

class CustomDioTransformer extends DefaultTransformer {
  /// The [Options] doesn't contain the cookie info. we add the cookie
  /// info to [Options.extra], and you can retrieve it in [ResponseInterceptor]
  /// and [Response] with `response.request.extra["cookies"]`.
  @override
  Future transformResponse(RequestOptions options, ResponseBody response) async {
    options.extra["self"] = 'XX';
    return super.transformResponse(options, response);
  }
}
