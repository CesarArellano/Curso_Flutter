import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final  UserPreferences _instancia = new UserPreferences._internal();
  
  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token.
  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String valor) {
    _prefs.setString('token', valor);
  }
}