import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/widget/custom_circular_progress_indicator.dart';
import 'package:red_crescent/src/core/widget/error_screen.dart';
import 'package:red_crescent/src/feature/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:red_crescent/src/feature/leaderboard/model/leaderboard.dart';
import 'package:red_crescent/src/feature/leaderboard/widget/leaderboard_card.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({
    super.key,
  });

  static const routePath = '/leaderboard';

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<MyColor>()!;

    return RefreshIndicator(
      color: color.red,
      backgroundColor: color.white,
      elevation: 0,
      onRefresh: refresh,
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          return switch (state) {
            LeaderboardInitial() => const SizedBox(),
            LeaderboardLoading() =>
              CustomCircularProgressIndicator(color: color.red),
            LeaderboardLoaded(userResponse: final users) =>
              _LeaderboardList(users: users),
            LeaderboardError(message: final message) => ErrorScreen(
                message: message,
                onTap: onRetry,
              ),
          };
        },
      ),
    );
  }

  void onRetry() {
    context.read<LeaderboardBloc>().add(GetLeaderboard());
  }

  Future<void> refresh() {
    context.read<LeaderboardBloc>().add(GetLeaderboard());
    return Future.delayed(const Duration(seconds: 0));
  }
}

class _LeaderboardList extends StatelessWidget {
  const _LeaderboardList({
    required this.users,
  });

  final LeaderBoard users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: Spacing.h16V12,
      itemCount: users.results.length,
      separatorBuilder: (context, index) => const SizedBox(height: 28),
      itemBuilder: (context, index) {
        final user = users.results[index];
        return LeaderboardCard(user: user);
      },
    );
  }
}
