import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'my_color.dart';

part 'sf_pro.tailor.dart';

@TailorMixin()
final class SfPro extends ThemeExtension<SfPro> with _$SfProTailorMixin {
  const SfPro({
    required this.s24W500,
    required this.s16W400,
    required this.s18W600,
    required this.s10W400,
    required this.myColor,
  });

  @override
  final TextStyle s24W500;
  @override
  final TextStyle s16W400;
  @override
  final TextStyle s18W600;
  @override
  final TextStyle s10W400;
  @override
  @override
  final MyColor myColor;

  factory SfPro.light() {
    final myColor = MyColor.ligth();

    return SfPro(
      s24W500: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'SF Pro Display',
        color: myColor.red,
      ),
      s16W400: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Display',
        color: myColor.red,
      ),
      s18W600: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'SF Pro Display',
        color: myColor.red,
      ),
      s10W400: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Display',
        color: myColor.red,
      ),
      myColor: myColor,
    );
  }
}
