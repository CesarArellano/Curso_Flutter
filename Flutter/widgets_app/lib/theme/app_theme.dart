import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    iconTheme: const IconThemeData( color: primaryColor ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
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