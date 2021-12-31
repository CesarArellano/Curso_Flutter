import 'package:flutter/material.dart';
import 'package:focus_code/theme/app_theme.dart';

class UiProvider extends ChangeNotifier {
  
  UiProvider({
    required bool isDarkmode
  }): _appThemeData = isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme;

  int _currentIndex = 0;

  ThemeData _appThemeData;
  
  int get currentIndex => _currentIndex;

  set currentIndex( int newIndex ) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  ThemeData get appThemeData => _appThemeData;

  set appThemeData( ThemeData newThemeData ) {
    _appThemeData = newThemeData;
    notifyListeners();
  }
}