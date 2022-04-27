import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF57CC99);

  ///colors for light mode
  static final lightTheme = ThemeData(
    primarySwatch: const MaterialColor(
      0xFF57CC99,
      <int, Color>{
        50: Color(0xFF57CC99),
        100: Color(0xFF57CC99),
        200: Color(0xFF57CC99),
        300: Color(0xFF57CC99),
        400: Color(0xFF57CC99),
        500: Color(0xFF57CC99),
        600: Color(0xFF57CC99),
        700: Color(0xFF57CC99),
        800: Color(0xFF57CC99),
        900: Color(0xFF57CC99),
      },
    ),
    fontFamily: 'Cairo',
    backgroundColor: const Color(0xFFFCFCFC),
    scaffoldBackgroundColor: const Color(0xFFEDF0F8),
    primaryColor: primaryColor,
    primaryColorDark: Color(0xff22577A),
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
  );

  /// colors for dark mode
  static final darkTheme = ThemeData(
    primarySwatch: const MaterialColor(
      0xFF57CC99,
      <int, Color>{
        50: Color(0xFF57CC99),
        100: Color(0xFF57CC99),
        200: Color(0xFF57CC99),
        300: Color(0xFF57CC99),
        400: Color(0xFF57CC99),
        500: Color(0xFF57CC99),
        600: Color(0xFF57CC99),
        700: Color(0xFF57CC99),
        800: Color(0xFF57CC99),
        900: Color(0xFF57CC99),
      },
    ),
    fontFamily: 'Cairo',
    backgroundColor: const Color(0xFF02121B),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF02121B),
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
  );
}
