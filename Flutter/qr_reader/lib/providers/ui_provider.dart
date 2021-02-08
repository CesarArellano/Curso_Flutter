import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 1;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    notifyListeners();  // Cuando se cambie este valor, notificará a los demás Widgets del cambio que lo estén escuchando.
  }
}