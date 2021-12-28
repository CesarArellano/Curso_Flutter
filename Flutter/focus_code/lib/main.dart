import 'package:flutter/material.dart';
import 'package:focus_code/providers/ui_provider.dart';

import 'package:focus_code/routes/app_router.dart';
import 'package:focus_code/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp( const AppState() );

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => UiProvider() )
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
      theme: AppTheme.lightTheme,
    );
  }
}