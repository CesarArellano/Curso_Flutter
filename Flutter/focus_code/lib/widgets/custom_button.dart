import 'package:flutter/material.dart';

import 'package:focus_code/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppTheme.primaryColor,
      disabledColor: Colors.grey,
      child: Text(title, style: const TextStyle( color: Colors.white ),),
      onPressed: onPressed,
    );
  }
}