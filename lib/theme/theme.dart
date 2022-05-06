import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: scaffoldBackgroundColorLight,
      colorScheme: const ColorScheme.light().copyWith(
          primary: primaryLight,
          secondary: secondaryLight,
          error: errorLight,
          secondaryContainer: Colors.black),
      textTheme: textTheme);
  static ThemeData darkTheme = ThemeData.dark();
}

Color primaryLight = const Color(0xff516EB4);
Color secondaryLight = const Color(0xffF9FEFF);
Color scaffoldBackgroundColorLight = const Color(0xffF5F5F5);
Color errorLight = const Color(0xffFF0033);

extension ColorSchemeExtension on ColorScheme {
  Color get validColor => const Color(0xff50C878);
}

TextTheme textTheme = Typography.whiteMountainView.copyWith(
  bodySmall: const TextStyle(fontSize: 14, color: Colors.black),
  bodyMedium: const TextStyle(fontSize: 16, color: Colors.black),
  bodyLarge: const TextStyle(fontSize: 18, color: Colors.black),
  labelMedium: const TextStyle(fontSize: 16, color: Colors.white),
);
