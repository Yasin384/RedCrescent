import 'package:dio/dio.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/model/participating.dart';

/// {@template task_repository}
/// TaskRepository.
/// {@endtemplate}
abstract interface class TaskDetailRepository {
  /// {@macro task_repository}

  Future<void> participateInTasks(int taskId);
  Future<void> participateOutTasks(int taskId);
  Future<Participation> getParticipate(int taskId);
}

/// {@template task_repository}
/// TaskRepositoryImpl.
/// {@endtemplate}
final class TaskDetailRepositoryImpl implements TaskDetailRepository {
  /// {@macro task_repository}
  const TaskDetailRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> participateInTasks(int taskId) async {
    try {
      await _dio.post('/api/tasks/$taskId/participate/');
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

  @override
  Future<void> participateOutTasks(int taskId) async {
    try {
      await _dio.post('/api/tasks/$taskId/leave/');
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
  
  @override
  Future<Participation> getParticipate(int taskId) async {
    try {
      final response = await _dio.get('/api/tasks/$taskId/is_participating/');
      return Participation.fromJson(response.data);
    } on Object catch (error, stackTrace) {
      Error.safeToString(error);
      stackTrace.toString();
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
