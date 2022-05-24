import 'package:flutter/material.dart';

import 'package:focus_code/theme/app_theme.dart';
import 'package:focus_code/user_prefs/user_preferences.dart';

import 'package:provider/provider.dart';
import 'package:focus_code/providers/ui_provider.dart';
  
class Settings extends StatelessWidget {
  
  const Settings({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 15.0, vertical: 20 ),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                  decoration: AppTheme.inputDecoration(),
                  value: UserPreferences.isDarkMode ? 'dark' : 'light',
                  items: const[
                    DropdownMenuItem( value: 'light', child: Text('Tema Claro')),
                    DropdownMenuItem( value: 'dark', child: Text('Tema Oscuro')),
                  ],
                  onChanged: ( value ) {
                    final uiProvider = Provider.of<UiProvider>(context, listen: false);
                    UserPreferences.isDarkMode = ( value == 'dark' );

                    uiProvider.appThemeMode = ( value == 'light' ) 
                      ? ThemeMode.light 
                      : ThemeMode.dark;
                  }
                ),
            ],
          ),
        )
      ),
    );
  }
}