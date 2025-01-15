import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// {@template tasks_screen}
/// TasksScreen widget.
/// {@endtemplate}
class TasksScreen extends StatefulWidget {
  /// {@macro tasks_screen}
  const TasksScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/tasks';

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _TasksScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_TasksScreenState>();

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

/// State for widget TasksScreen.
class _TasksScreenState extends State<TasksScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant TasksScreen oldWidget) {
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
  Widget build(BuildContext context) => const Placeholder();
}
