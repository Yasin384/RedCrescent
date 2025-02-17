import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/widget/custom_circular_progress_indicator.dart';

import '../theme/my_color.dart';

/// {@template red_buton}
/// RedButton.
/// {@endtemplate}
class RedButton extends StatelessWidget {
  /// {@macro red_buton}
  const RedButton({
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    super.key,
    this.btnColor,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context).extension<MyColor>()!;
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: Theme.of(context).filledButtonTheme.style!.copyWith(
            minimumSize: WidgetStatePropertyAll(
              Size(width, height * 0.05),
            ),
            backgroundColor: WidgetStatePropertyAll(btnColor ?? theme.red),
          ),
      child: isLoading == true
          ? _buildCircularProgressIndicator(theme)
          : Text(title),
    );
  }

  SizedBox _buildCircularProgressIndicator(MyColor theme) => SizedBox(
        height: 30,
        width: 30,
        child: CustomCircularProgressIndicator(color: theme.white),
      );
}
