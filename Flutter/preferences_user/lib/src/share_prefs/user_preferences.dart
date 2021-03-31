import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final  UserPreferences _instancia = new UserPreferences._internal();
  
  factory UserPreferences() {
    return _instancia;
  }
  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del género.
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int valor) {
    _prefs.setInt('genero', valor);
  }

  // GET y SET del color secundario.
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool valor) {
    _prefs.setBool('colorSecundario', valor);
  }

  // GET y SET del nombre.
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String valor) {
    _prefs.setString('nombreUsuario', valor);
  }

  // GET y SET del nombre.
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String valor) {
    _prefs.setString('ultimaPagina', valor);
  }
}