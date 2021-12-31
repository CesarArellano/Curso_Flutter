import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del género.
  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? false;
  }

  static set isDarkMode(bool isDarkMode) {
    _prefs.setBool('isDarkMode', isDarkMode);
  }
}