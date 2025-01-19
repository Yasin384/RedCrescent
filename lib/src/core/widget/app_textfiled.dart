import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/constans/spacing.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    this.initialValue,
    this.description = "",
    required this.controller,
    required this.label,
    required this.focusNode,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final String? initialValue;
  final String description;

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final sfPro = Theme.of(context).extension<SfPro>()!;
    final color = Theme.of(context).extension<MyColor>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: sfPro.s18W600),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          style: sfPro.s16W400.copyWith(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: Spacing.h16V12,
            isDense: true,
            isCollapsed: false,
            border: _buildOutlineInputBorder(color),
            enabledBorder: _buildOutlineInputBorder(color),
            focusedBorder: _buildOutlineInputBorder(color),
          ),
        ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(description, style: sfPro.s16W400)
        ]
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(MyColor color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color.sliverGrey,
        width: 1,
      ),
    );
  }
}
