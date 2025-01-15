import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// {@template profile_screen}
/// ProfileScreen widget.
/// {@endtemplate}
class ProfileScreen extends StatefulWidget {
  /// {@macro profile_screen}
  const ProfileScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/profile';

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _ProfileScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_ProfileScreenState>();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

/// State for widget ProfileScreen.
class _ProfileScreenState extends State<ProfileScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant ProfileScreen oldWidget) {
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
