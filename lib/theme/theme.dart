import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: scaffoldBackgroundColorLight,
      appBarTheme: AppBarTheme(
          toolbarHeight: 0, elevation: 0, color: scaffoldBackgroundColorLight),
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
Color errorLight = const Color(0xffFF5158);

extension ColorSchemeExtension on ColorScheme {
  Color get validColor => const Color(0xff50C878);
}

TextTheme textTheme = Typography.whiteMountainView.copyWith(
  titleLarge: const TextStyle(fontSize: 28, color: Colors.black),
  titleMedium: const TextStyle(fontSize: 24, color: Colors.black),
  titleSmall: const TextStyle(fontSize: 20, color: Colors.black),
  labelMedium: const TextStyle(fontSize: 16, color: Colors.white),
  bodySmall: const TextStyle(fontSize: 14, color: Colors.black),
  bodyMedium: const TextStyle(fontSize: 16, color: Colors.black),
  bodyLarge: const TextStyle(fontSize: 18, color: Colors.black),
);
