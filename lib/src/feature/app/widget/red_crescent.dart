import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/router/app_router.dart';
import 'package:red_crescent/src/core/theme/theme.dart';

/// {@template red_crescent}
/// RedCrescent widget.
/// {@endtemplate}
class RedCrescent extends StatelessWidget {
  /// {@macro red_crescent}
  const RedCrescent({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: MaterialApp.router(
        title: 'Red Crescent',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: lightTheme,
        routerConfig: appRouter,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: child ?? SizedBox(),
          );
        },
      ),
    );
  }
}
