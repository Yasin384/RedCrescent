import 'package:dio/dio.dart';
import 'package:red_crescent/src/core/model/access.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/auth/login/model/user_credential_dto.dart';

/// {@template login_repository}
/// LoginRepository.
/// {@endtemplate}
abstract interface class LoginRepository {
  /// {@macro login_repository}

  Future<Access> login(UserCredentialDto userCredentialDto);
}

/// {@template login_repository}
/// LoginRepositoryImpl.
/// {@endtemplate}
final class LoginRepositoryImpl implements LoginRepository {
  /// {@macro login_repository}
  const LoginRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<Access> login(UserCredentialDto userCredentialDto) async {
    try {
      final response = await _dio.post(
          'https://redcresent22.onrender.com/api/login/',
          data: userCredentialDto.toJson());

      print(response.data);

      if (response.data == null) {
        throw LoginException.incorrectData;
      }

      return Access.fromJson(response.data);
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        LoginException.fromStatusCode(error.response?.statusCode ?? 0),
        stackTrace,
      );
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
