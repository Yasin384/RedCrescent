import 'package:flutter/material.dart';

/// {@template sf_pro}
/// SfPro - расширение темы для стилизации шрифтов.
/// {@endtemplate}
final class SfPro extends ThemeExtension<SfPro> {
  final TextStyle? s24W500;

  final TextStyle? s16W400;

  final TextStyle? s18W600;

  const SfPro({
    this.s24W500,
    this.s16W400,
    this.s18W600,
  });

  @override
  ThemeExtension<SfPro> copyWith({
    TextStyle? s24W500,
    TextStyle? s16W400,
    TextStyle? s18W600,
  }) {
    return SfPro(
      s24W500: s24W500 ?? this.s24W500,
      s16W400: s16W400 ?? this.s16W400,
      s18W600: s18W600 ?? this.s18W600,
    );
  }

  @override
  ThemeExtension<SfPro> lerp(covariant ThemeExtension<SfPro>? other, double t) {
    if (other is! SfPro) {
      return this;
    }

    return SfPro(
      s24W500: TextStyle.lerp(s24W500, other.s24W500, t),
      s16W400: TextStyle.lerp(s16W400, other.s16W400, t),
      s18W600: TextStyle.lerp(s18W600, other.s18W600, t),
    );
  }

  static TextStyle getS24W500(BuildContext context) {
    return Theme.of(context).extension<SfPro>()?.s24W500 ??
        const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'SF Pro Display',
        );
  }

  static TextStyle getS16W400(BuildContext context) {
    return Theme.of(context).extension<SfPro>()?.s16W400 ??
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'SF Pro Display',
        );
  }

  static TextStyle getS18W600(BuildContext context) {
    return Theme.of(context).extension<SfPro>()?.s18W600 ??
        const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF Pro Display',
        );
  }

  @override
  String toString() {
    return 'SfPro(s24W500: $s24W500, s16W400: $s16W400, s18W600: $s18W600)';
  }
}
