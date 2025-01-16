import 'package:flutter/material.dart';

// TODO: replace with color pallet
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.backGroundColor,
    this.foreGroundColor,
  });

  factory AppButton.primary({
    required VoidCallback onTap,
    required String label,
  }) {
    return AppButton(
      label: label,
      onTap: onTap,
      backGroundColor: const Color(0xFF1565C0),
      foreGroundColor: const Color(0xFFFFFFFF),
    );
  }

  factory AppButton.outlined({
    required VoidCallback onTap,
    required String label,
  }) {
    return AppButton(
      label: label,
      onTap: onTap,
      foreGroundColor: const Color(0xFF1565C0),
      backGroundColor: const Color(0xFFFFFFFF),
    );
  }

  final String label;
  final VoidCallback onTap;
  final Color? backGroundColor;
  final Color? foreGroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(
          side: BorderSide(
            color: const Color(0xFF1565C0),
          ),
        ),
        backgroundColor: backGroundColor,
        foregroundColor: foreGroundColor,
      ),
      child: Text(label),
    );
  }
}
