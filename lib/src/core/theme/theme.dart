import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';
import 'package:red_crescent/src/core/theme/sf_pro.dart';

final ligthTheme = ThemeData(
  // --- Button stle start region. --- //

  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      _ligthColor.red,
    ),
  )),

  // --- Button stle end region. --- //

  extensions: [
    // --- Light Color  --- //
    _ligthColor,
    _lightText,
  ],
);

final _ligthColor = MyColor.light();
final _lightText = SfPro.light();
