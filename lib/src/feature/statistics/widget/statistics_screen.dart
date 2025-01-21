import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
// import 'package:red_crescent/src/core/theme/my_color.dart';

/// {@template statistics_screen}
/// StatisticsScreen widget.
/// {@endtemplate}
class StatisticsScreen extends StatefulWidget {
  /// {@macro statistics_screen}
  const StatisticsScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/statistics';

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _StatisticsScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_StatisticsScreenState>();

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

/// State for widget StatisticsScreen.
class _StatisticsScreenState extends State<StatisticsScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant StatisticsScreen oldWidget) {
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
    // final myColor = Theme.of(context).extension<MyColor>()!;
    return SizedBox();
  }
}
