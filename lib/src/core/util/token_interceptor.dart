import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:red_crescent/src/core/constans/storage_key.dart';
import 'package:red_crescent/src/core/model/access.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';

final class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required FlutterSecureStorage flutterSecureStorage,
    required Dio dio,
  })  : _flutterSecureStorage = flutterSecureStorage,
        _dio = dio;

  final FlutterSecureStorage _flutterSecureStorage;
  final Dio _dio;
  static bool _isRefreshing = false;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final accessJson = await _flutterSecureStorage.read(key: StorageKey.access);
    if (accessJson != null && accessJson.isNotEmpty) {
      final access = accessFromJson(accessJson);
      options.headers['Authorization'] = 'Bearer ${access.access}';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    final response = err.response;
    if (response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final accessJson = await _flutterSecureStorage.read(key: StorageKey.access);
        if (accessJson == null) {
          throw LoginException.fromStatusCode(401);
        }

        final currentAccess = accessFromJson(accessJson);

        final refreshDio = Dio(BaseOptions(
          baseUrl: _dio.options.baseUrl,
          headers: {'Content-Type': 'application/json'},
        ));

        final refreshResponse = await refreshDio.post(
          '/token/refresh/',
          data: {'refresh': currentAccess.refresh},
        );

        if (refreshResponse.statusCode == 200) {
          final newAccess = Access(
            access: refreshResponse.data['access'],
            refresh: refreshResponse.data['refresh'],
            user: currentAccess.user,
          );

          await _flutterSecureStorage.write(
            key: StorageKey.access,
            value: accessToJson(newAccess),
          );

          // Повторяем оригинальный запрос с новым токеном
          err.requestOptions.headers['Authorization'] = 'Bearer ${newAccess.access}';

          final retryResponse = await _dio.fetch(err.requestOptions);
          return handler.resolve(retryResponse);
        }
      } on DioException catch (error) {
        if (error.response?.statusCode == 401) {
          await _clearTokens();
          throw LoginException.fromStatusCode(401);
        }
        return handler.next(error);
      } catch (error) {
        return handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    }
    return handler.next(err);
  }

  Future<void> _clearTokens() async {
    await _flutterSecureStorage.delete(key: StorageKey.access);
  }
}