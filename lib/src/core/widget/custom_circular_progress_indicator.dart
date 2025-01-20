import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MyColor>()!;
    return Center(
      child: CircularProgressIndicator(
        color: color ?? theme.white,
        strokeWidth: 2,
      ),
    );
  }
}


