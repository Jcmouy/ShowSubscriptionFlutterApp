// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_remote_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthorizationRemoteClient implements AuthorizationRemoteClient {
  _AuthorizationRemoteClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserTokenDto> authenticateWithUserCredentials(credentials) async {
    ArgumentError.checkNotNull(credentials, 'credentials');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(credentials?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/authenticate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserTokenDto.fromJson(_result.data);
    return value;
  }
}
