import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/red_crescent_icon.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppSettingsWidget extends StatelessWidget {
  AppSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SfPro>()!;
    final l = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Настройки приложения',
          style: theme.s16W500,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _settings.length,
          itemBuilder: (context, index) {
            final item = _settings[index];
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['title'] as String,
                    style: theme.s16W400.copyWith(
                      color: theme.myColor.black,
                    ),
                  ),
                  IconButton(
                    onPressed: item['onTap'] as VoidCallback,
                    icon: Icon(RedCrescentIcon.arrowIcon),
                    iconSize: 16,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  final _settings = [
    {'title': 'Настройки', 'onTap': () => print('Profile Settings')},
    {
      'title': 'Технический чат поддержки',
      'onTap': () => print('Notifications')
    },
    {'title': 'Частые вопросы', 'onTap': () => print('Privacy Settings')},
  ];
}
