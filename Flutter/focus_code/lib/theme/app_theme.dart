import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Colors.deepPurple;

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    colorScheme: ThemeData().colorScheme.copyWith( // Change color icons TextFormField
      primary: primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: primaryColor.shade100,
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
    colorScheme: ThemeData.dark().colorScheme.copyWith( // Change color icons TextFormField
      primary: primaryColor.shade100,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: Colors.white,
      suffixIconColor: Colors.white
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.deepPurple,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle( fontSize: 14, fontWeight: FontWeight.w600 )
      )
    ),
  );

  static InputDecoration inputDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      prefixIcon: const Icon( Icons.app_settings_alt ),
      label: const Text('Cambiar tema'),
    );
  }
}