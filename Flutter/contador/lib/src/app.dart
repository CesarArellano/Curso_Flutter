import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  //Sobreescribir el método build
  @override
  Widget build(context) {
    return MaterialApp(
        home: Center(
      child: HomePage(),
    ));
  }
}
