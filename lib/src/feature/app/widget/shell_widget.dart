import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/model/page_tile.dart';
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
    final color = Theme.of(context).extension<MyColor>()!;
    final sfPro = Theme.of(context).extension<SfPro>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          PageTile.fromValue(context, shell.currentIndex),
          style: sfPro.s24W500,
        ),
      ),
      body: SafeArea(child: shell),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _goBranch,
        type: BottomNavigationBarType.fixed,
        currentIndex: shell.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(RedCrescentIcon.leaderBoardIcon),
            label: l.leaderboard,
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
        selectedIconTheme: IconThemeData(color: color.red),
        unselectedLabelStyle: sfPro.s10W400,
        selectedLabelStyle: sfPro.s10W400,
        selectedItemColor: color.red,
      ),
    );
  }
}
