import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Message App'),
        ),
        body: Center(
          child: Container(
            child: Text('Message Page'),
          ),
        ),
      );
  }
}