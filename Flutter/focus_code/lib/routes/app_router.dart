import 'package:flutter/material.dart';
import 'package:focus_code/screens/screens.dart';

class AppRouter {

  static String initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': ( _ ) => HomeScreen(),
    'map': ( _ ) => const MapScreen(),
  };

  static Route<dynamic> onGenerateRoute( RouteSettings settings ) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen()
    );
  }
}