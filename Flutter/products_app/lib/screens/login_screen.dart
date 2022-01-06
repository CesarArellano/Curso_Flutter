import 'package:flutter/material.dart';
import 'package:products_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackground()
    );
  }
}