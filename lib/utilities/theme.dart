import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(
      0xFF1EF762,
      <int, Color>{
        //50: Color(0xFF4EF04D),
        50: Color(0x1A1EF762),
        100: Color(0x331EF762),
        200: Color(0x4D1EF762),
        300: Color(0x661EF762),
        400: Color(0x801EF762),
        500: Color(0xFF1EF762),
        600: Color(0x991EF762),
        700: Color(0x831EF762),
        800: Color(0xCC1EF762),
        900: Color(0xE61EF762),
      },
    ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(brightness: Brightness.dark));
}
