import 'package:go_router/go_router.dart';
import 'package:red_crescent/src/feature/auth/login/widget/login_screen.dart';
import 'package:red_crescent/src/feature/splash/widget/select_auth_type_screen.dart';
import 'package:red_crescent/src/feature/splash/widget/welcome_screen.dart';

final authRouter = GoRouter(
  initialLocation: WelcomeScreen.routePath,
  routes: [
    GoRoute(
      path: WelcomeScreen.routePath,
      builder: (context, state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: LoginScreen.routePath,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
        path: SelectAuthTypeScreen.routePath,
        builder: (context, state) {
          return SelectAuthTypeScreen();
        }),
  ],
);
