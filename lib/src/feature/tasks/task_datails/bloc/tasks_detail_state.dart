part of 'tasks_detail_bloc.dart';

sealed class TasksDetailState extends Equatable {
  const TasksDetailState();

  @override
  List<Object?> get props => [];
}

final class TasksParticipatingInitial extends TasksDetailState {}

final class TasksParticipating extends TasksDetailState {}

final class TasksParticipateSuccess extends TasksDetailState {
  final String message;

  const TasksParticipateSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

final class TasksParticipateError extends TasksDetailState {
  final String message;

  const TasksParticipateError(this.message);

  @override
  List<Object?> get props => [message];
}

final class TasksParticipate extends TasksDetailState {
  const TasksParticipate({required this.participation});

  final Participation participation;

  @override
  List<Object?> get props => [participation];

}
