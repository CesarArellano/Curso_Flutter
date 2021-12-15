import 'package:flutter/material.dart';

// Screens
import 'package:movie_app/screens/screens.dart';

void main() => runApp( const MyApp() );

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: 'home',
      routes: {
        "home": ( _ ) => const HomeScreen(),
        "details": ( _ ) => const DetailsScreen(),
      },
    );
  }
}