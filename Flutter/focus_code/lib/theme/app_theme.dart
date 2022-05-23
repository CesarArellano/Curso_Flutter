import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Colors.deepPurple;

  static final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    splashFactory: InkSparkle.splashFactory,
    primaryColor: primaryColor,
    colorScheme: ThemeData().colorScheme.copyWith( // Change color icons TextFormField
      primary: primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      backgroundColor: primaryColor,
      centerTitle: true
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: primaryColor.shade100,
      iconTheme:  MaterialStateProperty.all(const IconThemeData(color: Colors.black)),
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle( fontSize: 14, fontWeight: FontWeight.w500 )
      )
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    splashFactory: InkSparkle.splashFactory,
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
      indicatorColor: primaryColor.shade400,
      iconTheme:  MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle( fontSize: 14, fontWeight: FontWeight.w500 )
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