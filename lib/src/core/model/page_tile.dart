import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template page_tile}
/// PageTile enumeration
/// {@endtemplate}
enum PageTile implements Comparable<PageTile> {
  leaderboard(0),

  statistics(1),

  tasks(2),

  profile(3);

  /// {@macro page_tile}
  const PageTile(this.value);

  ///  Данный метод возвращает текущее название выбранной страницы.
  static String fromValue(BuildContext context, int value, {String? fallback}) {
    final l = AppLocalizations.of(context);
    switch (value) {
      case 0:
        return l.leaderboard;

      case 1:
        return l.statistics;

      case 2:
        return l.tasks;

      case 3:
        return l.profile;
      default:
        return fallback ?? (throw ArgumentError.value(value));
    }
  }

  final int value;

  @override
  int compareTo(PageTile other) => value.compareTo(other.value);
}
