import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/custom_circular_progress_indicator.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
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
    final text = AppLocalizations.of(context);
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final theme = Theme.of(context).extension<MyColor>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text.leaderboard,
          style: sfPro.s24W500,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            context.read<LeaderboardBloc>().add(GetLeaderboard());
            return Future.delayed(Duration(seconds: 2));
          },
          child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
            builder: (context, state) {
              return switch (state) {
                LeaderboardInitial() => const SizedBox(),
                LeaderboardLoading() =>
                  CustomCircularProgressIndicator(color: theme.red),
                LeaderboardLoaded(userResponse: final users) =>
                  _LeaderboardList(
                    users: users,
                  ),
                LeaderboardError(message: final message) =>
                  _LeaderboardError(message: message),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _LeaderboardError extends StatelessWidget {
  const _LeaderboardError({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final theme = Theme.of(context).extension<MyColor>()!;
    final text = AppLocalizations.of(context);
    return Padding(
      padding: Spacing.h16V12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: sfPro.s16W400.copyWith(
                color: theme.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RedButton(
                title: text.tryAgain,
                onPressed: () {
                  context.read<LeaderboardBloc>().add(GetLeaderboard());
                })
          ],
        ),
      ),
    );
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
