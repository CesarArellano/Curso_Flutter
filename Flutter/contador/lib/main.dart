import 'package:flutter/material.dart';

// Importaciones propias
import 'package:contador/src/pages/contador_page.dart';

void main() => runApp( const MyApp() );

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  //Sobreescribir el método build
  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center( 
        child: ContadorPage(),
      )
    );
  }

}
