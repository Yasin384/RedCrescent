import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:red_crescent/src/core/constans/storage_key.dart';
import 'package:red_crescent/src/core/model/access.dart';

/// {@template token_interceptor}
/// TokenInterceptor.
/// {@endtemplate}
final class TokenInterceptor extends Interceptor {
  /// {@macro token_interceptor}
  const TokenInterceptor({required FlutterSecureStorage flutterSecureStorage})
      : _flutterSecureStorage = flutterSecureStorage;

  final FlutterSecureStorage _flutterSecureStorage;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final access = await _flutterSecureStorage.read(key: StorageKey.access);

    if (access != null && access.isNotEmpty) {
      options.data['Authorization'] = 'Bearer ${accessFromJson(access).access}';
      handler.next(options);
    }
    handler.next(options);
  }
}
