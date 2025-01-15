import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';

/// {@template red_buton}
/// RedButton.
/// {@endtemplate}
class RedButton extends StatelessWidget {
  /// {@macro red_buton}
  const RedButton({
    required this.title,
    required this.onPressed,
    super.key,
  });
  final String title;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: Spacing.h10,
      child: FilledButton(
        onPressed: onPressed,
        style: Theme.of(context).filledButtonTheme.style!.copyWith(
              minimumSize: WidgetStatePropertyAll(
                Size(width, height * 0.05),
              ),
            ),
        child: Text(title),
      ),
    );
  }
}
