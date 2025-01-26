import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/widget/custom_circular_progress_indicator.dart';
import 'package:red_crescent/src/core/widget/error_screen.dart';
import 'package:red_crescent/src/feature/tasks/bloc/tasks_bloc.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/widget/task_details_screen.dart';
import 'package:red_crescent/src/feature/tasks/widget/tasks_card.dart';

/// {@template tasks_screen}
/// TasksScreen widget.
/// {@endtemplate}
class TasksScreen extends StatefulWidget {
  /// {@macro tasks_screen}
  const TasksScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/tasks';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<MyColor>()!;

    return RefreshIndicator(
      color: color.red,
      backgroundColor: color.white,
      onRefresh: refresh,
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return switch (state) {
            TasksInitial() => const SizedBox(),
            TasksLoading() =>
              Center(child: CustomCircularProgressIndicator(color: color.red)),
            TasksLoaded(tasks: final tasks) => _TasksScreen(tasks: tasks),
            TasksError(message: final message) => ErrorScreen(
                message: message,
                onTap: onRetry,
              ),
          };
        },
      ),
    );
  }

  Future<void> refresh() {
    context.read<TasksBloc>().add(GetTasks());
    return Future.delayed(const Duration(seconds: 0));
  }

  void onRetry() {
    context.read<TasksBloc>().add(GetTasks());
  }
}

/// {@template tasks_screen}
/// _TasksScreen widget.
/// {@endtemplate}
class _TasksScreen extends StatelessWidget {
  /// {@macro tasks_screen}
  const _TasksScreen({
    super.key,
    required this.tasks, // ignore: unused_element
  });

  final Tasks tasks;

  /* #endregion */
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: Spacing.h16V12,
      separatorBuilder: (context, index) => const SizedBox(height: 40),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _pushToTasksDetails(context, tasks.results[index]),
        child: TasksCard(taskResult: tasks.results[index]),
      ),
      itemCount: tasks.results.length,
    );
    //   Center(
    //   child: ElevatedButton(
    //       onPressed: () {
    //         RepositoryProvider.of<TaskRepository>(context).loadTask();
    //       },
    //       child: const Text('load task')),
    // );
  }

}

void _pushToTasksDetails(BuildContext context, TaskResult taskResult) {
  context.go(
    '${TasksScreen.routePath}/${TaskDetailsScreen.routePath}',
    extra: taskResult, // Передаем сам объект
  );
}
