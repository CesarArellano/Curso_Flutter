import 'package:flutter/material.dart';

import 'package:pushapp/screens/home_screen.dart';
import 'package:pushapp/screens/message_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'message',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'message': (BuildContext context) => MessageScreen()
      },
    );
  }
}