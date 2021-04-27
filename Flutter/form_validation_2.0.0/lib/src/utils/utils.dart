import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty ) return false;
  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

void showAlert(BuildContext context, String message) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: Text('Ok')
          )
        ]
      );
    }
  );
}