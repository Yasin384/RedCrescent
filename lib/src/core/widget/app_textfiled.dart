import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    super.key,
    required this.controller,
    required this.label,
    this.initialValue,
    this.description = "",
  });

  final TextEditingController controller;
  final String label;
  final String? initialValue;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<SfPro>()!;
    final color = Theme.of(context).extension<MyColor>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: textTheme.s18W600,
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          decoration: InputDecoration(
            border: _buildOutlineInputBorder(color),
            enabledBorder: _buildOutlineInputBorder(color),
            focusedBorder: _buildOutlineInputBorder(color),
          ),
        ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(description, style: textTheme.s16W400)
        ]
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(MyColor color) {

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide:  BorderSide(
        color: color.greyText ,
        width: 1,
      ),
    );
  }
}
