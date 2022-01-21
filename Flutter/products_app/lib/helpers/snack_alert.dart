import 'package:flutter/material.dart';

void snackAlert(BuildContext context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(errorMsg)
    )
  );
}