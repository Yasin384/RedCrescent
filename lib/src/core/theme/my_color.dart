import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'my_color.tailor.dart';

/// {@template my_color}
/// MyColor.
/// {@endtemplate}
@TailorMixin()
final class MyColor extends ThemeExtension<MyColor> with _$MyColorTailorMixin {
  /// {@macro my_color}
  const MyColor({required this.red});

  @override
  final Color red;

  /// {@macro my_color}
  factory MyColor.ligth() {
    return MyColor(
      red: Color(0xffD32F2F),
    );
  }
}
