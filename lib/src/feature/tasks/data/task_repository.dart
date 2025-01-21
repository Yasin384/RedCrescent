import 'package:dio/dio.dart';

/// {@template task_repository}
/// TaskRepository.
/// {@endtemplate}
abstract interface class TaskRepository {
  /// {@macro task_repository}

  Future<void> loadTask();
}

/// {@template task_repository}
/// TaskRepositoryImpl.
/// {@endtemplate}
final class TaskRepositoryImpl implements TaskRepository {
  /// {@macro task_repository}
  const TaskRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<void> loadTask() async {
    await _dio.get('/api/events/');
  }
}
