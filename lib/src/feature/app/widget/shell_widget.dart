import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/red_crescent_icon.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

/// {@template shell_widget}
/// ShellWidget widget.
/// {@endtemplate}
class ShellWidget extends StatelessWidget {
  /// {@macro shell_widget}
  const ShellWidget({
    required this.shell,
    super.key,
  });

  final StatefulNavigationShell shell;

  void _goBranch(int index) {
    shell.goBranch(
      index,
      initialLocation: index == shell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context).extension<MyColor>();
    final textTheme = Theme.of(context).extension<SfPro>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: shell,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _goBranch,
        type: BottomNavigationBarType.fixed,
        currentIndex: shell.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(RedCrescentIcon.leaderBoardIcon),
            label: l.leaderbord,
          ),
          BottomNavigationBarItem(
            icon: Icon(RedCrescentIcon.statisticIcon),
            label: l.statistics,
          ),
          BottomNavigationBarItem(
            icon: Icon(RedCrescentIcon.tasksIcon),
            label: l.tasks,
          ),
          BottomNavigationBarItem(
            icon: Icon(RedCrescentIcon.profileIcon),
            label: l.profile,
          ),
        ],
        selectedIconTheme: IconThemeData(color: theme?.red),
        unselectedLabelStyle: textTheme?.s10W400,
        selectedLabelStyle: textTheme?.s10W400,
        selectedItemColor: theme?.red,
      ),
    );
  }
}
