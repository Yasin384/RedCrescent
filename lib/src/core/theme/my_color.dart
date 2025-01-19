import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'my_color.tailor.dart';

/// {@template my_color}
/// MyColor.
/// {@endtemplate}
@TailorMixin()
final class MyColor extends ThemeExtension<MyColor> with _$MyColorTailorMixin {
  /// {@macro my_color}
  const MyColor({
    required this.red,
    required this.blue,
    required this.grey,
    required this.black,
    required this.white,
    required this.sliverGrey,
  });

  @override
  final Color red;
  @override
  final Color blue;
  @override
  final Color grey;
  @override
  final Color black;
  @override
  final Color white;

  /// HEX: #D9D9D9

  @override
  final Color sliverGrey;

  /// {@macro my_color}
  factory MyColor.light() {
    return MyColor(
      sliverGrey: Color(0xffD9D9D9),
      red: Color(0xffD32F2F),
      blue: Color(0xff1565C0),
      grey: Color(0xffC2C2C2),
      black: Color(0xff000000),
      white: Color(0xffffffff),
    );
  }
}
