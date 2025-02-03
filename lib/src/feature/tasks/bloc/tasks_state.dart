part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  bool get isLoginInProgress => switch (this) {
    TasksLoading _ => true,
    _ => false,
  };

  @override
  List<Object?> get props => [];
}

final class TasksInitial extends TasksState {}

final class TasksLoading extends TasksState {}

final class TasksLoaded extends TasksState {
  final Tasks tasks;
  final bool isLoadingMore;
  final bool hasReachedMax;


  const TasksLoaded({
    required this.tasks,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });

  TasksLoaded copyWith({
    Tasks? tasks,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return TasksLoaded(
      tasks: tasks ?? this.tasks,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [tasks, isLoadingMore, hasReachedMax];
}

final class TasksError extends TasksState {
  final String message;

  const TasksError(this.message);

  @override
  List<Object?> get props => [message];
}

