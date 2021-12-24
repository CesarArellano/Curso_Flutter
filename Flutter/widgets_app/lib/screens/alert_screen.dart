import 'dart:io'show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
  
class AlertScreen extends StatelessWidget {
  
  const AlertScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Mostrar alerta'),
          ),
          onPressed: () => Platform.isIOS 
            ? displayDialogIos(context)
            : displayDialogAndroid(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  void displayDialogIos( BuildContext context ) {
    showCupertinoDialog(
      context: context,
      builder: ( context ) => CupertinoAlertDialog(
        title: const Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(height: 10),
            FlutterLogo( size: 100)
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      )
    );
  }

  void displayDialogAndroid( BuildContext context ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ( context ) => AlertDialog(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ),
        title: const Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Este es el contenido de la alerta'),
            SizedBox(height: 10),
            FlutterLogo( size: 100)
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      )
    );
  }
}