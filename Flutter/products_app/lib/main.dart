import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:products_app/providers/product_provider.dart';
import 'package:products_app/screens/screens.dart';

void main() => runApp( const MyApp() );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => ProductProvider() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        initialRoute: 'login',
        routes: {
          'login': ( _ ) => const LoginScreen(),
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