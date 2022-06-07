import 'package:flutter/material.dart';
import 'package:focus_code/theme/app_theme.dart';

class UiProvider extends ChangeNotifier {
  
  UiProvider({
    required bool isDarkAmoled,
    required bool isDark,
  }): _appTheme = isDarkAmoled ? AppTheme.darkAmoledTheme : isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  int _currentIndex = 0;

  ThemeData _appTheme;
  
  int get currentIndex => _currentIndex;

  set currentIndex( int newIndex ) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  ThemeData get appTheme => _appTheme;

  set appTheme( ThemeData newTheme ) {
    _appTheme = newTheme;
    notifyListeners();
  }
}