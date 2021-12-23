import 'package:flutter/material.dart';
import 'package:widgets_app/screens/listview1_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets App',
      home: ListView1Screen()
    );
  }
}