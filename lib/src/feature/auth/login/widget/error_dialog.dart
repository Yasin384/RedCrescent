import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/model/login_exception.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_crescent/src/core/widget/red_buton.dart';

class CustomErrorDialog extends StatelessWidget {
  const CustomErrorDialog(
      {super.key,
      required this.error,
      required this.onRetry,
      required this.onHelp});

  final LoginException error;
  final VoidCallback onRetry;
  final VoidCallback onHelp;

  static void show({
    required BuildContext context,
    required LoginException error,
    required VoidCallback onRetry,
    required VoidCallback onHelp,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => CustomErrorDialog(
        error: error,
        onRetry: onRetry,
        onHelp: onHelp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context).extension<MyColor>()!;
    final textTheme = Theme.of(context).extension<SfPro>()!;

    return Dialog(
      backgroundColor: theme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l.error,
              style: textTheme.s24W500.copyWith(
                color: theme.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              l.errorMessage,
              textAlign: TextAlign.center,
              style: textTheme.s16W400.copyWith(
                color: theme.black,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: RedButton(
                title: l.tryAgain,
                onPressed: () {
                  onRetry();
                },
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                onHelp();
              },
              child: Text(
                l.help,
                style: textTheme.s18W600.copyWith(
                  color: theme.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
