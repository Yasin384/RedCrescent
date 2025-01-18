import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/feature/auth/authorization/bloc/authorization_bloc.dart';

/// {@template profile_screen}
/// ProfileScreen widget.
/// {@endtemplate}
class ProfileScreen extends StatefulWidget {
  /// {@macro profile_screen}
  const ProfileScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

/// State for widget ProfileScreen.
class _ProfileScreenState extends State<ProfileScreen> {
  late final Future<PackageInfo> packageInfo;

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
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final packageInfo = RepositoryProvider.of<PackageInfo>(context);
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        final user = state.user!;
        return Column(
          children: [
            CircleAvatar(),
            // Text(user.is),
            Text('${l.appVersion}: ${packageInfo.buildNumber}'),
            Text(''),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthorizationBloc>(context)
                      .add(UnAuthoirized());
                },
                child: const Text('log out '))
          ],
        );
      },
    );
  }
}
