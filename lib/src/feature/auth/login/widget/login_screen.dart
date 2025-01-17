import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/feature/auth/authorization/data/authorization_repository.dart';
import 'package:red_crescent/src/feature/auth/login/bloc/login_bloc.dart';
import 'package:red_crescent/src/feature/auth/login/data/login_repository.dart';

/// {@template login_screen}
/// LoginScreen widget.
/// {@endtemplate}
class LoginScreen extends StatelessWidget {
  /// {@macro login_screen}
  const LoginScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/login';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepositoryImpl(
        dio: RepositoryProvider.of<Dio>(context),
      ),
      child: BlocProvider(
        create: (context) => LoginBloc(
            loginRepository: RepositoryProvider.of<LoginRepository>(context),
            authorizationRepository:
                RepositoryProvider.of<AuthorizationRepository>(context)),
        child: _LoginScreen(),
      ),
    );
  }
}

/// {@template login_screen}
/// _LoginScreen widget.
/// {@endtemplate}
class _LoginScreen extends StatefulWidget {
  /// {@macro login_screen}
  const _LoginScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<_LoginScreen> createState() => __LoginScreenState();
}

/// State for widget _LoginScreen.
class __LoginScreenState extends State<_LoginScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant _LoginScreen oldWidget) {
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
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: state.isLoginInProgress
                              ? Colors.blueGrey
                              : Colors.red),
                      child: const Text('hello'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
