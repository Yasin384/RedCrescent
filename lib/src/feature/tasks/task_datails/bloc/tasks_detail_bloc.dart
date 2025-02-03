import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/data/tasks_detail_repository.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/model/participating.dart';

part 'tasks_detail_event.dart';

part 'tasks_detail_state.dart';

class TasksDetailBloc extends Bloc<TasksDetailEvent, TasksDetailState> {
  TasksDetailBloc({required TaskDetailRepository taskDetailRepository})
      : _taskDetailRepository = taskDetailRepository,
        super(TasksParticipatingInitial()) {
    on<TasksDetailEvent>((event, emit) => switch (event) {
          ParticipateInTasks() => _onParticipateInTasks(event, emit),
          ParticipateOutTasks() => _onParticipateOutTasks(event, emit),
          Participate() => _getParticipate(event, emit),
        });
  }

  final TaskDetailRepository _taskDetailRepository;

  Future<void> _onParticipateInTasks(
      ParticipateInTasks event, Emitter<TasksDetailState> emit) async {
    try {
      emit(TasksParticipating());
      await _taskDetailRepository.participateInTasks(event.taskId);
      emit(TasksParticipateSuccess('Вы присоединились к задаче'));
    } on Object catch (error, stackTrace) {
      emit(TasksParticipateError('Не удалось принять участие в задаче'));
      onError(error, stackTrace);
    }
  }

  Future<void> _onParticipateOutTasks(ParticipateOutTasks event, Emitter<TasksDetailState> emit) async {
    try {
      emit(TasksParticipating());
      await _taskDetailRepository.participateOutTasks(event.taskId);
      emit(TasksParticipateSuccess('Вы покинули задачу'));
    } on Object catch (error, stackTrace) {
      emit(TasksParticipateError('Не удалось покинуть задачу'));
      onError(error, stackTrace);
    }
  }

  Future<void> _getParticipate(
      Participate event, Emitter<TasksDetailState> emit) async {
    try {
     final participation =  await _taskDetailRepository.getParticipate(event.taskId);
      emit(TasksParticipate(participation: participation));
    } on Object catch (error, stackTrace) {
      onError(error, stackTrace);
    }
  }
}
