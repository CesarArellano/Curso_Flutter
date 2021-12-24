import 'package:flutter/material.dart';

import 'package:widgets_app/routes/app_routes.dart';
import 'package:widgets_app/screens/alert_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: ( _ ) => const AlertScreen()
        );
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo
        )
      ),
    );
  }
}