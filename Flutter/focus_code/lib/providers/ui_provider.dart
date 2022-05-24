import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  
  UiProvider({
    required bool isDarkmode
  }): _appThemeMode = isDarkmode ? ThemeMode.dark : ThemeMode.light;

  int _currentIndex = 0;

  ThemeMode _appThemeMode;
  
  int get currentIndex => _currentIndex;

  set currentIndex( int newIndex ) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  ThemeMode get appThemeMode => _appThemeMode;

  set appThemeMode( ThemeMode newThemeMode ) {
    _appThemeMode = newThemeMode;
    notifyListeners();
  }
}