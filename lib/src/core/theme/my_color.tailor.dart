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
  Color get grey;
  Color get black;
  Color get white;
  Color get sliverGrey;

  @override
  MyColor copyWith({
    Color? red,
    Color? blue,
    Color? grey,
    Color? black,
    Color? white,
    Color? sliverGrey,
  }) {
    return MyColor(
      red: red ?? this.red,
      blue: blue ?? this.blue,
      grey: grey ?? this.grey,
      black: black ?? this.black,
      white: white ?? this.white,
      sliverGrey: sliverGrey ?? this.sliverGrey,
    );
  }

  @override
  MyColor lerp(covariant ThemeExtension<MyColor>? other, double t) {
    if (other is! MyColor) return this as MyColor;
    return MyColor(
      red: Color.lerp(red, other.red, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      sliverGrey: Color.lerp(sliverGrey, other.sliverGrey, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyColor &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(blue, other.blue) &&
            const DeepCollectionEquality().equals(grey, other.grey) &&
            const DeepCollectionEquality().equals(black, other.black) &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality()
                .equals(sliverGrey, other.sliverGrey));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(blue),
      const DeepCollectionEquality().hash(grey),
      const DeepCollectionEquality().hash(black),
      const DeepCollectionEquality().hash(white),
      const DeepCollectionEquality().hash(sliverGrey),
    );
  }
}

extension MyColorBuildContextProps on BuildContext {
  MyColor get myColor => Theme.of(this).extension<MyColor>()!;
  Color get red => myColor.red;
  Color get blue => myColor.blue;
  Color get grey => myColor.grey;
  Color get black => myColor.black;
  Color get white => myColor.white;

  /// HEX: #D9D9D9
  Color get sliverGrey => myColor.sliverGrey;
}
