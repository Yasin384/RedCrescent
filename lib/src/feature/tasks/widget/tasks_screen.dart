import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/feature/tasks/data/task_repository.dart';

/// {@template tasks_screen}
/// TasksScreen widget.
/// {@endtemplate}
class TasksScreen extends StatelessWidget {
  /// {@macro tasks_screen}
  const TasksScreen({
    super.key, // ignore: unused_element
  });
  static const routePath = '/tasks';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<TaskRepository>(
      create: (context) =>
          TaskRepositoryImpl(dio: RepositoryProvider.of<Dio>(context)),
      child: _TasksScreen(),
    );
  }
}

/// {@template tasks_screen}
/// _TasksScreen widget.
/// {@endtemplate}
class _TasksScreen extends StatefulWidget {
  /// {@macro tasks_screen}
  const _TasksScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<_TasksScreen> createState() => _TasksScreenState();
}

/// State for widget _TasksScreen.
class _TasksScreenState extends State<_TasksScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant _TasksScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            RepositoryProvider.of<TaskRepository>(context).loadTask();
          },
          child: const Text('load task')),
    );
  }
}
