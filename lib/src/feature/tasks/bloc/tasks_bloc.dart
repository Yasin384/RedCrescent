import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/tasks/data/task_repository.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:stream_transform/stream_transform.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required TaskRepository tasksRepository})
      : _taskRepository = tasksRepository,
        super(TasksInitial()) {
    on<TasksEvent>(
      (event, emit) {
        return switch (event) {
          GetTasks() => _onGetTasks(event, emit),
        };
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final TaskRepository _taskRepository;

  Future<void> _onGetTasks(GetTasks event, Emitter<TasksState> emit) async {
    try {
      final isInitial = event.isInitial || state is! TasksLoaded;
      final currentPage = _getCurrentPage(isInitial);

      if (!isInitial && (state as TasksLoaded).hasReachedMax) return;

      emit(isInitial
          ? TasksLoading()
          : (state as TasksLoaded).copyWith(isLoadingMore: true));

      final newTasks = await _taskRepository.loadTask(currentPage);

      emit(TasksLoaded(
        tasks:
            isInitial ? newTasks : (state as TasksLoaded).tasks.merge(newTasks),
        hasReachedMax: newTasks.next == null,
      ));
    } on LoginException catch (error, stackTrace) {
      emit(TasksError('Ошибка авторизации: ${error.statusCode}'));
      onError(error, stackTrace);
    } on Object catch (error, stackTrace) {
      emit(TasksError('Произошла ошибка при загрузке данных'));
      onError(error, stackTrace);
    } finally {
      // ...
    }
  }

  int _parsePageNumber(String? url) {
    if (url == null) return 1;
    final uri = Uri.parse(url);
    return uri.queryParameters.containsKey('page')
        ? int.tryParse(uri.queryParameters['page'] ?? '') ?? 1
        : 1;
  }

  int _getCurrentPage(bool isInitial) {
    if (isInitial) return 1;
    final currentState = state as TasksLoaded;
    return _parsePageNumber(currentState.tasks.next);
  }

// Future<void> _onGetInitialTasks(
//     GetInitialTasks event,
//     Emitter<TasksState> emit,
//     ) async {
//   try {
//     emit(TasksLoading());
//     final tasks = await _taskRepository.loadTask(1);
//
//     emit(TasksLoaded(tasks: tasks));
//   } on LoginException catch (error, stackTrace) {
//     emit(TasksError('Ошибка авторизации: ${error.statusCode}'));
//     onError(error, stackTrace);
//   } on Object catch (error, stackTrace) {
//     emit(TasksError('Произошла ошибка при загрузке данных'));
//     onError(error, stackTrace);
//   }
// }
//
// Future<void> _onLoadMoreTasks(
//     LoadMoreTasks event,
//     Emitter<TasksState> emit,
//     ) async {
//   if (state is! TasksLoaded) return;
//   final currentState = state as TasksLoaded;
//
//   if (currentState.isLoadingMore || currentState.tasks.next == null) return;
//
//   emit(currentState.copyWith(isLoadingMore: true));
//
//   try {
//     final nextPage = _getPageNumber(currentState.tasks.next!);
//     final newTasks = await _taskRepository.loadTask(nextPage);
//
//     emit(TasksLoaded(
//       tasks: Tasks(
//         count: newTasks.count,
//         next: newTasks.next,
//         previous: newTasks.previous,
//         results: [
//           ...currentState.tasks.results,
//           ...newTasks.results,
//         ],
//       ),
//       isLoadingMore: false,
//     ));
//   } on LoginException catch (error, stackTrace) {
//     emit(TasksError('Ошибка авторизации: ${error.statusCode}'));
//     onError(error, stackTrace);
//   } on Object catch (error, stackTrace) {
//     emit(TasksError('Произошла ошибка при загрузке данных'));
//     onError(error, stackTrace);
//   }
// }
//
// int _getPageNumber(String url) {
//   final uri = Uri.parse(url);
//   return int.parse(uri.queryParameters['page'] ?? '1');
// }
}
