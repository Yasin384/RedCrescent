
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:red_crescent/src/core/enum/role_enum.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/leaderboard/model/leaderboard.dart';

abstract interface class LeaderboardRepository {

  Future<LeaderBoard> getLeaderboard();
}

final class LeaderboardRepositoryImpl implements LeaderboardRepository{
  const LeaderboardRepositoryImpl({
    required dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<LeaderBoard> getLeaderboard() async {
    try {
      final response = await _dio.get('/api/users/');
      final leaderboard = LeaderBoard.fromJson(response.data);
      final sortedLeaderboard = _sortLeaderboard(leaderboard.results);
      return LeaderBoard(count: leaderboard.count, results:sortedLeaderboard );
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

  List<UserResult> _sortLeaderboard(List<UserResult> users) {
    return users.where((user) => user.role == Role.volunteer).toList()..sort((a, b) {
      final aHours = a.totalHours;
      final bHours = b.totalHours;
      return bHours.compareTo(aHours);
    });
  }

}