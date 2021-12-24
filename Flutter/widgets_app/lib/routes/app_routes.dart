
import 'package:flutter/material.dart';
import 'package:widgets_app/models/models.dart';
import 'package:widgets_app/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';
  
  static final menuOptions = <MenuOption>[
    MenuOption( route:'listview1', name: 'ListView 1', icon: Icons.list_alt ),
    MenuOption( route:'listview2', name: 'ListView 2', icon: Icons.list ),
    MenuOption( route:'card', name: 'Tarjetas - Cards', icon: Icons.switch_account_rounded ),
    MenuOption( route:'alert', name: 'Alertas - Alerts', icon: Icons.add_alert ),
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    'alert': ( _ ) => const AlertScreen(),
    'card': ( _ ) => const CardScreen(),
    'home': ( _ ) => const HomeScreen(),
    'listview1': ( _ ) => const ListView1Screen(),
    'listview2': ( _ ) => const ListView2Screen(),
  };

  static Route<dynamic> onGenerateRoute ( RouteSettings settings) {
    return MaterialPageRoute(
      builder: ( _ ) => const AlertScreen()
    );
  }
  
}