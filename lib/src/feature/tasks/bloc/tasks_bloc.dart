import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/tasks/data/task_repository.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required TaskRepository tasksRepository})
      : _taskRepository = tasksRepository,
        super(TasksInitial()) {
    on<TasksEvent>((event, emit) {
      return switch (event) {
        GetTasks() => _onGetTasks(event, emit),
      };
    });
  }

  final TaskRepository _taskRepository;

  Future<void> _onGetTasks(GetTasks event, Emitter<TasksState> emit) async {
    try {
      emit(TasksLoading());
      final tasks = await _taskRepository.loadTask();
      emit(TasksLoaded(tasks));
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
}
