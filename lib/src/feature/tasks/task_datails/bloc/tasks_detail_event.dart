part of 'tasks_detail_bloc.dart';

sealed class TasksDetailEvent extends Equatable {
  const TasksDetailEvent();
}

final class ParticipateInTasks extends TasksDetailEvent {
  const ParticipateInTasks({required this.taskId});
  final int taskId;

  @override
  List<Object> get props => [taskId];
}

final class ParticipateOutTasks extends TasksDetailEvent {
  const ParticipateOutTasks({required this.taskId});
  final int taskId;

  @override
  List<Object> get props => [taskId];
}

final class Participate extends TasksDetailEvent {
  const Participate({required this.taskId});
  final int taskId;

  @override
  List<Object> get props => [taskId];
}
