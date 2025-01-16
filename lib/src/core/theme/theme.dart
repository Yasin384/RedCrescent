import 'package:flutter/material.dart';
import 'package:red_crescent/src/core/theme/my_color.dart';

final lightTheme = ThemeData(
  // --- Button stle start region. --- //

  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      _ligthColor.red,
    ),
  ),
  ),

  // --- Button stle end region. --- //

  extensions: [
    // --- Light Color  --- //
    _ligthColor,
  ],
);

final _ligthColor = MyColor.light();
