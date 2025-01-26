import 'package:flutter/widgets.dart';

/// {@template spacing}
/// Spacing.
/// {@endtemplate}
abstract final class Spacing {
  /// {@macro spacing}
  const Spacing();

  static const h10 = EdgeInsets.symmetric(horizontal: 10.0);

  static const h16 = EdgeInsets.symmetric(horizontal: 16.0);

  static const h16V12 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
}
