import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

class TitleWithValueRow extends StatelessWidget {
  const TitleWithValueRow({
    required this.label,
    required this.value,
    this.style,
    super.key,
  });

  final String label, value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final sfPro = Theme.of(context).extension<SfPro>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: sfPro.s16W400.copyWith(color: sfPro.myColor.grey)),
        Text(value,
            style: style ?? sfPro.s16W400.copyWith(color: sfPro.myColor.grey)),
      ],
    );
  }
}
