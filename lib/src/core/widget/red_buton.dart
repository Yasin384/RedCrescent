import 'package:flutter/material.dart';

import '../theme/my_color.dart';

/// {@template red_buton}
/// RedButton.
/// {@endtemplate}
class RedButton extends StatelessWidget {
  /// {@macro red_buton}
  const RedButton({
    required this.title,
    required this.onPressed,
    this.isLoading,
    super.key,
    this.btnColor,
  });
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context).extension<MyColor>()!;
    return FilledButton(
      onPressed: isLoading == true ? null : onPressed,
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

  CircularProgressIndicator _buildCircularProgressIndicator(MyColor theme) =>
      CircularProgressIndicator(
        strokeWidth: 2.0,
        color: theme.white,
      );
}
