import 'package:flutter/material.dart';


class AnimatedScreen extends StatelessWidget {

  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Animated World!'),
      ),
    );
  }
}