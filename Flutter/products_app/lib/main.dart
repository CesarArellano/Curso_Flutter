import 'package:flutter/material.dart';
import 'package:products_app/screens/checking_auth_screen.dart';

import 'package:provider/provider.dart';

import 'package:products_app/screens/screens.dart';

import 'package:products_app/providers/auth_provider.dart';
import 'package:products_app/providers/product_provider.dart';

void main() => runApp( const MyApp() );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => ProductProvider() ),
        ChangeNotifierProvider( create: ( _ ) => AuthProvider() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        initialRoute: 'checking',
        routes: {
          'checking': ( _ ) => const CheckingAuthScreen(),
          'login': ( _ ) => const LoginScreen(),
          'register': ( _ ) => const RegisterScreen(),
          'home': ( _ ) => const HomeScreen(),
          'product': ( _ ) => const ProductScreen(),
        },
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
          )
        ),
      ),
    );
  }
}