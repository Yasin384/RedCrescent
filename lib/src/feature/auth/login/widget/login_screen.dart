import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/app_textfiled.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
import 'package:red_crescent/src/feature/auth/authorization/data/authorization_repository.dart';
import 'package:red_crescent/src/feature/auth/login/bloc/login_bloc.dart';
import 'package:red_crescent/src/feature/auth/login/data/login_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/feature/auth/login/model/user_credential_dto.dart';
import 'package:red_crescent/src/feature/auth/login/widget/error_dialog.dart';

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
        dio: context.read<Dio>(),
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
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context).extension<MyColor>()!;
    final textTheme = Theme.of(context).extension<SfPro>()!;

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginError) {
          CustomErrorDialog.show(
            context: context,
            error: state.loginException,
            onRetry: () {
              Navigator.of(context).pop();
            },
            onHelp: () {
              Navigator.of(context).pop();
            },
          );        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: Spacing.h14,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(l.help, style: textTheme.s16W400),
                    ),
                    const SizedBox(height: 40),
                    Text(l.forAuthorization,
                        style: textTheme.s24W500, textAlign: TextAlign.center),
                    const SizedBox(height: 40),
                    AppTextFiled(
                      controller: loginController,
                      label: l.login,
                      description: l.usernameProvided,
                    ),
                    const SizedBox(height: 30),
                    AppTextFiled(
                      controller: passwordController,
                      label: l.password,
                      description: l.passwordProvided,
                    ),
                    const SizedBox(height: 90),
                    RedButton(
                      isLoading: state.isLoginInProgress,
                      title: l.signIn,
                      onPressed: () {
                        print('jjjj');
                        _singIn(context);
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _singIn(BuildContext context) {
    context.read<LoginBloc>().add(
          Logged(
            userCredentialDto: UserCredentialDto(
              username: loginController.text,
              password: passwordController.text,
            ),
          ),
        );
  }
}
