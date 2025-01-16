// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'my_color.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MyColorTailorMixin on ThemeExtension<MyColor> {
  Color get red;
  Color get blue;
  Color get greyText;
  Color get blackText;
  Color get white;

  @override
  MyColor copyWith({
    Color? red,
    Color? blue,
    Color? greyText,
    Color? blackText,
    Color? white,
  }) {
    return MyColor(
      red: red ?? this.red,
      blue: blue ?? this.blue,
      greyText: greyText ?? this.greyText,
      blackText: blackText ?? this.blackText,
      white: white ?? this.white,
    );
  }

  @override
  MyColor lerp(covariant ThemeExtension<MyColor>? other, double t) {
    if (other is! MyColor) return this as MyColor;
    return MyColor(
      red: Color.lerp(red, other.red, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      greyText: Color.lerp(greyText, other.greyText, t)!,
      blackText: Color.lerp(blackText, other.blackText, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyColor &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(blue, other.blue) &&
            const DeepCollectionEquality().equals(greyText, other.greyText) &&
            const DeepCollectionEquality().equals(blackText, other.blackText) &&
            const DeepCollectionEquality().equals(white, other.white));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(blue),
      const DeepCollectionEquality().hash(greyText),
      const DeepCollectionEquality().hash(blackText),
      const DeepCollectionEquality().hash(white),
    );
  }
}

extension MyColorBuildContextProps on BuildContext {
  MyColor get myColor => Theme.of(this).extension<MyColor>()!;
  Color get red => myColor.red;
  Color get blue => myColor.blue;
  Color get greyText => myColor.greyText;
  Color get blackText => myColor.blackText;
  Color get white => myColor.white;
}
