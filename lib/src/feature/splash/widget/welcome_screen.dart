import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:red_crescent/src/core/constans/assets.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
import 'package:red_crescent/src/feature/auth/login/widget/login_screen.dart';
import 'package:red_crescent/src/feature/splash/widget/select_auth_type_screen.dart';

/// {@template welcome_screen}
/// WelcomeScreen widget.
/// {@endtemplate}
class WelcomeScreen extends StatelessWidget {
  /// {@macro welcome_screen}
  const WelcomeScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/welcome';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: height * 0.15),
              SvgPicture.asset(Assets.logoCrescent),
              SizedBox(height: 20),
              Text(
                l.welcomeToRedCrescent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              Spacer(),
              RedButton(
                title: l.continueWord,
                onPressed: () => _pushToRedirectAuthScreen(context),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _pushToRedirectAuthScreen(BuildContext context) {
    context.push(LoginScreen.routePath);
  }
}
