import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:red_crescent/src/feature/app/widget/shell_widget.dart';
import 'package:red_crescent/src/feature/leaderboard/widget/leaderboard_screen.dart';
import 'package:red_crescent/src/feature/profile/widget/profile_screen.dart';

import 'package:red_crescent/src/feature/statistics/widget/statistics_screen.dart';
import 'package:red_crescent/src/feature/tasks/model/task.dart';
import 'package:red_crescent/src/feature/tasks/task_datails/widget/task_details_screen.dart';
import 'package:red_crescent/src/feature/tasks/widget/tasks_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final _leaderboardNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'leaderboard');
final _statiscticsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'statisctics');

final _tasksNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'statisctics');

final _profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'statisctics');

final appRouter = GoRouter(
  initialLocation: TasksScreen.routePath,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, shell) {
        return NoTransitionPage(
          child: ShellWidget(shell: shell),
        );
      },
      branches: [
        // --- Leader bord branch --- //
        StatefulShellBranch(
          navigatorKey: _leaderboardNavigatorKey,
          routes: [
            GoRoute(
                path: LeaderboardScreen.routePath,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: LeaderboardScreen(),
                  );
                }),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _statiscticsNavigatorKey,
          routes: [
            GoRoute(
              path: StatisticsScreen.routePath,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: StatisticsScreen());
              },
            )
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _tasksNavigatorKey,
          routes: [
            GoRoute(
              path: TasksScreen.routePath,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: TasksScreen());
              },
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileScreen.routePath,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: ProfileScreen());
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: TaskDetailsScreen.routePath,
      builder: (context, state) {
        return TaskDetailsScreen(taskResult: state.extra as TaskResult);
      },
    ),
  ],
  observers: [
    // --- Router observer --- //
    RouteObserver()
  ],
);
