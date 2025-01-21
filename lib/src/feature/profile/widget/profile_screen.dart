import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';
import 'package:red_crescent/src/feature/auth/authorization/bloc/authorization_bloc.dart';
import 'package:red_crescent/src/feature/profile/widget/app_settings_widget.dart';
import 'package:red_crescent/src/feature/profile/widget/profile_details_widget.dart';

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
        return Scaffold(
          appBar: AppBar(
            title: Text(l.profile, style: theme.s24W500),
          ),
          body: SafeArea(
            child: Padding(
              padding: Spacing.h16V12,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetails(
                      user: user,
                      theme: theme,
                    ),
                    ProfileStatistics(
                      user: user,
                      theme: theme,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l.achievements, style: theme.s16W400),
                          ],
                        ),
                        SizedBox(width: 61),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: user.achievements.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 25,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: theme.myColor.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      user.achievements[index].name,
                                      style: theme.s16W400
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    AppSettingsWidget(),
                    Text(
                      '${l.appVersion}: ${packageInfo.buildNumber}',
                      style: theme.s16W400,
                    ),
                    SizedBox(height: 10),
                    RedButton(title: l.exit, onPressed: () => _signOut(context))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    context.read<AuthorizationBloc>().add(UnAuthoirized());
  }
}
