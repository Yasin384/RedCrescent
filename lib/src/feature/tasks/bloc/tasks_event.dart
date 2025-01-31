part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

final class GetTasks extends TasksEvent {
  final bool isInitial;
  const GetTasks({this.isInitial = false});
  @override
  List<Object> get props => [isInitial];
}
