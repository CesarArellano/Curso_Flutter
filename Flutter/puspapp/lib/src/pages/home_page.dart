import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home App'),
        ),
        body: Center(
          child: Container(
            child: Text('Home Page'),
          ),
        ),
      );
  }
}