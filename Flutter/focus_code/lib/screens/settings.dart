import 'package:flutter/material.dart';
import 'package:focus_code/providers/ui_provider.dart';
import 'package:focus_code/theme/app_theme.dart';
import 'package:provider/provider.dart';
  
class Settings extends StatelessWidget {
  
  const Settings({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                  decoration: AppTheme.inputDecoration(),
                  value: 'light',
                  items: const[
                    DropdownMenuItem( value: 'light', child: Text('Tema Claro')),
                    DropdownMenuItem( value: 'dark', child: Text('Tema Oscuro')),
                  ],
                  onChanged: ( value ) {
                    final uiProvider = Provider.of<UiProvider>(context, listen: false);
                    uiProvider.appThemeData = ( value == 'light' ) 
                      ? AppTheme.lightTheme 
                      : AppTheme.darkTheme;
                  }
                ),
            ],
          ),
        )
      ),
    );
  }
}