import 'package:flutter/material.dart';
import 'package:focus_code/user_prefs/user_preferences.dart';

import 'package:provider/provider.dart';

import 'package:focus_code/providers/scan_history_provider.dart';
import 'package:focus_code/providers/ui_provider.dart';

import 'package:focus_code/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp( const AppState() );
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider( create: (_) => UiProvider( isDarkmode: UserPreferences.isDarkMode ) ),
        ChangeNotifierProvider( create: ( _ ) => ScanHistoryProvider() ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Focus Code',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: Provider.of<UiProvider>(context).appThemeData,
    );
  }
}