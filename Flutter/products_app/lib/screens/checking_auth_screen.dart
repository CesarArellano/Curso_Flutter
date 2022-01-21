import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:products_app/providers/auth_provider.dart';
import 'package:products_app/screens/screens.dart';


class CheckingAuthScreen extends StatelessWidget {

  const CheckingAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authProvider.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

            if( !snapshot.hasData ) {
              return const CircularProgressIndicator.adaptive();
            }

            final token = snapshot.data;

            if( token == '' ) {
              Future.microtask(() {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __, ___ ) => const LoginScreen(),
                  transitionDuration: const Duration( seconds:  0 )
                ));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __, ___ ) => const HomeScreen(),
                  transitionDuration: const Duration( seconds:  0 )
                ));
              });
            }

            return Container();

          },
        )
      ),
    );
  }
}