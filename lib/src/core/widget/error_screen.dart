import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.message, required this.onTap});

  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final theme = Theme.of(context).extension<MyColor>()!;
    final text = AppLocalizations.of(context);
    return Padding(
      padding: Spacing.h16,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: sfPro.s16W400.copyWith(
                color: theme.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RedButton(
              title: text.tryAgain,
              onPressed: onTap
            )
          ],
        ),
      ),
    );
  }
}
