import 'package:flutter/material.dart';

class AppCheckboxTile extends StatelessWidget {
  const AppCheckboxTile({
    super.key,
    required this.label,
    required this.onChanged,
    required this.value,
  });

  final String label;
  final ValueChanged<bool?> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.only(),
      title: Text(label),
    );
  }
}
