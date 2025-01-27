import 'package:dio/dio.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';

/// {@template task_repository}
/// TaskRepository.
/// {@endtemplate}
abstract interface class TaskRepository {
  /// {@macro task_repository}

  Future<Tasks> loadTask(int page);
}

/// {@template task_repository}
/// TaskRepositoryImpl.
/// {@endtemplate}
final class TaskRepositoryImpl implements TaskRepository {
  /// {@macro task_repository}
  const TaskRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<Tasks> loadTask(int page) async {
    try {
      final response = await _dio.get('/api/tasks/', queryParameters: {
        'page': page,
      });
      return Tasks.fromJson(response.data);
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
