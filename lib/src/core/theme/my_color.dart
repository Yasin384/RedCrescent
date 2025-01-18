import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'my_color.tailor.dart';

/// {@template my_color}
/// MyColor.
/// {@endtemplate}
@TailorMixin()
final class MyColor extends ThemeExtension<MyColor> with _$MyColorTailorMixin {
  /// {@macro my_color}
  const MyColor({required this.red, required this.blue, required this.greyText, required this.blackText, required this.white});

  @override
  final Color red;
  @override
  final Color blue;
  @override
  final Color greyText;
  @override
  final Color blackText;
  @override
  final Color white;

  /// {@macro my_color}
  factory MyColor.light() {
    return MyColor(
      red: Color(0xffD32F2F),
      blue: Color(0xff1565C0),
      greyText: Color(0xffC2C2C2),
      blackText: Color(0xff000000),
      white: Color(0xffffffff),
    );
  }
}