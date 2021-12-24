import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    iconTheme: const IconThemeData( color: primaryColor ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo,
        shape: const StadiumBorder(),
        elevation: 0
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( primary: primaryColor )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    )
  );

  static final ThemeData darkTheme= ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    iconTheme: const IconThemeData( color: primaryColor ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
    ),
    scaffoldBackgroundColor: Colors.black
  );

}