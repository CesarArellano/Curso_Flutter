import 'package:flutter/material.dart';

class InputDecorations {
  
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? icon 
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide( color: Colors.deepPurple )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.deepPurple
        )
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.deepPurple),
      prefixIcon: Icon( 
        icon ?? Icons.person, 
        color: Colors.deepPurple
      )
    );
  }
}