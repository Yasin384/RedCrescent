import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/router/app_router.dart';
import 'package:red_crescent/src/core/router/auth/auth_router.dart';
import 'package:red_crescent/src/feature/auth/authorization/bloc/authorization_bloc.dart';

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
        //  switch (state) {
        //   Authorized() => Router.withConfig(config: config),
        //   UnAuthorized() => authRouter,
        // }

        return switch (state) {
          Authorized() => Router.withConfig(config: appRouter),
          UnAuthorized() => Router.withConfig(config: authRouter),
        };
      },
    );
  }
}
