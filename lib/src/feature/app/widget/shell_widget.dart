import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template shell_widget}
/// ShellWidget widget.
/// {@endtemplate}
class ShellWidget extends StatelessWidget {
  /// {@macro shell_widget}
  const ShellWidget({
    required this.shell,
    super.key, // ignore: unused_element
  });

  final StatefulNavigationShell shell;

  void _goBranch(int index) {
    shell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == shell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      body: shell,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _goBranch,
        type: BottomNavigationBarType.fixed,
        currentIndex: shell.currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.adb_outlined), label: l.leaderbord),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: l.statistics),
          BottomNavigationBarItem(icon: Icon(Icons.add_link), label: l.tasks),
          BottomNavigationBarItem(icon: Icon(Icons.adb), label: l.profile),
        ],
        
        unselectedLabelStyle: TextStyle(fontSize: 8),
        selectedLabelStyle: TextStyle(fontSize: 8),
      ),
    );
  }
}
