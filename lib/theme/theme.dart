import 'package:flutter/material.dart';

var font = 'Be Vietnam Pro';

class ThemeManager {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: scaffoldBackgroundColorLight,
      bottomAppBarColor: secondaryLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: secondaryLight,
          elevation: 0,
          unselectedLabelStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          selectedLabelStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
      appBarTheme: AppBarTheme(
        toolbarHeight: 0,
        elevation: 0,
        color: scaffoldBackgroundColorLight,
      ),
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
  Color get validColor => const Color(0xff3BBD9F);
}

TextTheme textTheme = TextTheme(
  titleLarge: TextStyle(
      fontSize: 28,
      fontFamily: font,
      color: Colors.black,
      fontWeight: FontWeight.bold),
  titleMedium: TextStyle(
      fontSize: 24,
      fontFamily: font,
      color: Colors.black,
      fontWeight: FontWeight.bold),
  titleSmall: TextStyle(
      fontSize: 20,
      fontFamily: font,
      color: Colors.black,
      fontWeight: FontWeight.bold),
  labelMedium: TextStyle(fontSize: 16, fontFamily: font, color: Colors.white),
  bodySmall: TextStyle(fontSize: 14, fontFamily: font, color: Colors.black),
  bodyMedium: TextStyle(fontSize: 16, fontFamily: font, color: Colors.black),
  bodyLarge: TextStyle(fontSize: 18, fontFamily: font, color: Colors.black),
);
