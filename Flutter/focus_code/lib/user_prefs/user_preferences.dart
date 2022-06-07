import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del isDarkMode.
  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? false;
  }

  static set isDarkMode(bool isDarkMode) {
    _prefs.setBool('isDarkMode', isDarkMode);
  }

  // GET y SET del isDarkAmoledMode.
  static bool get isDarkAmoledMode {
    return _prefs.getBool('isDarkAmoledMode') ?? false;
  }

  static set isDarkAmoledMode(bool isDarkMode) {
    _prefs.setBool('isDarkAmoledMode', isDarkMode);
  }
}