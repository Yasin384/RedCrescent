import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/router/app_router.dart';
import 'package:red_crescent/src/core/router/auth/auth_router.dart';
import 'package:red_crescent/src/core/theme/theme.dart';
import 'package:red_crescent/src/feature/auth/authorization/bloc/authorization_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template auth_redirect}
/// AuthRedirect widget.
/// {@endtemplate}
class AuthRedirect extends StatelessWidget {
  /// {@macro auth_redirect}
  const AuthRedirect({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: lightTheme,
          routerConfig: switch (state) {
            Authorized() => appRouter,
            UnAuthorized() => authRouter,
          },
        );
      },
    );
  }
}
