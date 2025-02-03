import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/widget/custom_circular_progress_indicator.dart';
import 'package:red_crescent/src/core/widget/error_screen.dart';
import 'package:red_crescent/src/feature/tasks/bloc/tasks_bloc.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/widget/task_details_screen.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

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
            TasksLoaded(
              tasks: final tasks,
              isLoadingMore: final isLoading,
              hasReachedMax: final hasReachedMax
            ) =>
              _TasksScreen(
                tasks: tasks,
                scrollController: _scrollController,
                isLoadingMore: isLoading,
                hasReachedMax: hasReachedMax,
              ),
            TasksError(message: final message) => ErrorScreen(
                message: message,
                onTap: onRetry,
              ),
          };
        },
      ),
    );
  }

  void _onScroll() {
    final state = context.read<TasksBloc>().state;
    if (state is! TasksLoaded) return;

    if (_isBottom && !state.hasReachedMax && !state.isLoadingMore) {
      context.read<TasksBloc>().add(const GetTasks());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> refresh() {
    context.read<TasksBloc>().add(GetTasks(isInitial: true));
    return Future.delayed(const Duration(seconds: 0));
  }

  void onRetry() {
    context.read<TasksBloc>().add(GetTasks(isInitial: true));
  }
}

/// {@template tasks_screen}
/// _TasksScreen widget.
/// {@endtemplate}
class _TasksScreen extends StatelessWidget {
  /// {@macro tasks_screen}
  const _TasksScreen({
    required this.tasks,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.scrollController,
    super.key, // ignore: unused_element
  });

  final Tasks tasks;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final ScrollController scrollController;

  /* #endregion */
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<MyColor>()!;
    return ListView.separated(
      padding: Spacing.h16V12,
      controller: scrollController,
      separatorBuilder: (context, index) => const SizedBox(height: 40),
      itemBuilder: (context, index) {
        if (index >= tasks.results.length) {
          return isLoadingMore
              ? Padding(
                  padding: Spacing.h16,
                  child: Center(
                      child: CustomCircularProgressIndicator(color: color.red)),
                )
              : const SizedBox.shrink();
        }
        return GestureDetector(
          onTap: () => context.push(TaskDetailsScreen.routePath,
              extra: tasks.results[index]),
          child: TasksCard(
            taskResult: tasks.results[index],
          ),
        );
      },
      itemCount: tasks.results.length + (hasReachedMax ? 0 : 1),
    );
  }
}
