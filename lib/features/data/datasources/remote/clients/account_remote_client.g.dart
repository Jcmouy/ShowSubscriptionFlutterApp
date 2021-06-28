// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_remote_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AccountRemoteClient implements AccountRemoteClient {
  _AccountRemoteClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<void> registerUser(usuarioAccountDto) async {
    ArgumentError.checkNotNull(usuarioAccountDto, 'usuarioAccountDto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuarioAccountDto?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    await _dio.request<void>('/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<void> changePassword(usuarioAccountChangePasswordDto) async {
    ArgumentError.checkNotNull(
        usuarioAccountChangePasswordDto, 'usuarioAccountChangePasswordDto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(
        usuarioAccountChangePasswordDto?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    await _dio.request<void>('/account/change-password',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }
}
