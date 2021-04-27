import 'package:flutter/material.dart';

import 'package:form_validation/src/userPreferences/user_preferences.dart';
import 'package:form_validation/src/bloc/provider.dart';

import 'package:form_validation/src/pages/home_page.dart';
import 'package:form_validation/src/pages/login_page.dart';
import 'package:form_validation/src/pages/producto_page.dart';
import 'package:form_validation/src/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
  
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Formularios Bloc',
        initialRoute: (prefs.token == '') ? 'login' : 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
          'registro': (BuildContext context) => RegisterPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      )
    );
  }
}