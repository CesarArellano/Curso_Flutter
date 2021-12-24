
import 'package:flutter/cupertino.dart';
import 'package:widgets_app/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';
  
  static Map<String, Widget Function(BuildContext)> routes = {
    'alert': ( _ ) => const AlertScreen(),
    'card': ( _ ) => const CardScreen(),
    'home': ( _ ) => const HomeScreen(),
    'listview1': ( _ ) => const ListView1Screen(),
    'listview2': ( _ ) => const ListView2Screen(),
  };
}