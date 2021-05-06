import 'package:flutter/material.dart';

import 'package:newsapp/src/theme/theme.dart';

import 'package:newsapp/src/pages/tabs_page.dart';

import 'package:provider/provider.dart';
import 'package:newsapp/src/services/news_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
        theme: myTheme,
      ),
    );
  }
}