
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/leaderboard/model/user_response.dart';

abstract interface class LeaderboardRepository {

  Future<UserResponse> getLeaderboard();
}

final class LeaderboardRepositoryImpl implements LeaderboardRepository{
  const LeaderboardRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<UserResponse> getLeaderboard() async {
    try {
      final response = await dio.get('/api/users/');
      if(response.data == null) {
        throw Exception('Пустой ответ от сервера');
      }
      print(response.data);
      return UserResponse.fromJson(response.data);
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