import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Colors.deepPurple;

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.deepPurple.shade100,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle( fontSize: 14, fontWeight: FontWeight.w600 )
      )
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.deepPurple.shade100,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle( fontSize: 14, fontWeight: FontWeight.w600 )
      )
    ),
  );
}