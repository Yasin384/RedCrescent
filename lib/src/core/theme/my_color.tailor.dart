// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'my_color.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MyColorTailorMixin on ThemeExtension<MyColor> {
  Color get red;

  @override
  MyColor copyWith({
    Color? red,
  }) {
    return MyColor(
      red: red ?? this.red,
    );
  }

  @override
  MyColor lerp(covariant ThemeExtension<MyColor>? other, double t) {
    if (other is! MyColor) return this as MyColor;
    return MyColor(
      red: Color.lerp(red, other.red, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyColor &&
            const DeepCollectionEquality().equals(red, other.red));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(red),
    );
  }
}

extension MyColorBuildContextProps on BuildContext {
  MyColor get myColor => Theme.of(this).extension<MyColor>()!;
  Color get red => myColor.red;
}
