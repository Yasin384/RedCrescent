import 'package:flutter/material.dart';

//todo: add  color
class AppTextfield extends StatelessWidget {
  const AppTextfield({
    super.key,
    required this.label,
    this.description = "",
    this.initialText,
    this.controller,
    this.maxLine,
    this.readOnly = false,
    this.onTap,
  });

  final String label;
  final String description;
  final String? initialText;
  final TextEditingController? controller;
  final int? maxLine;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: textTheme.labelLarge,
        ),
        const SizedBox(height: 12),
        TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          initialValue: initialText,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            description,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w300,
            ),
          )
        ]
      ],
    );
  }
}
