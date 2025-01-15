import 'package:flutter/material.dart';

/// {@template leaderboard_screen}
/// LeaderboardScreen widget.
/// {@endtemplate}
class LeaderboardScreen extends StatefulWidget {
  /// {@macro leaderboard_screen}
  const LeaderboardScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/leaderboard';

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

/// State for widget LeaderboardScreen.
class _LeaderboardScreenState extends State<LeaderboardScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant LeaderboardScreen oldWidget) {
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
    return Center(child: Text('leaderbord'));
  }
}
