import 'package:flutter/material.dart';

import 'package:preferences_user/src/share_prefs/user_preferences.dart';

import 'package:preferences_user/src/pages/home_page.dart';
import 'package:preferences_user/src/pages/settings_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',  
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage()
      },
    );
  }
}