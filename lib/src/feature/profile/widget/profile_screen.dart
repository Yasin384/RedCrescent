import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/feature/auth/authorization/bloc/authorization_bloc.dart';
import 'package:red_crescent/src/feature/profile/widget/app_settings_widget.dart';
import 'package:red_crescent/src/feature/profile/widget/profile_details_widget.dart';
import 'package:red_crescent/src/feature/profile/widget/profile_header_widget.dart';

import 'profile_statistics_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routePath = '/profile';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context).extension<SfPro>()!;

    final packageInfo = RepositoryProvider.of<PackageInfo>(context);

    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        final user = state.user!;
        return SafeArea(
          child: Padding(
            padding: Spacing.h16V12,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(
                    title: l.profile,
                    theme: theme,
                  ),
                  ProfileDetails(
                    user: user,
                    theme: theme,
                  ),
                  ProfileStatistics(
                    user: user,
                    theme: theme,
                  ),
                  AppSettingsWidget(),
                  Text(
                    '${l.appVersion}: ${packageInfo.buildNumber}',
                    style: theme.s16W400,
                  ),
                  LogoutButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<AuthorizationBloc>(context).add(UnAuthoirized());
      },
      child: const Text('log out'),
    );
  }
}
