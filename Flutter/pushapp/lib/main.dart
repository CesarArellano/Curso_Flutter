import 'package:flutter/material.dart';

import 'package:pushapp/screens/home_screen.dart';
import 'package:pushapp/screens/message_screen.dart';
import 'package:pushapp/services/push_notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
} 

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() { 
    super.initState();
    PushNotificationService.messagesStream.listen((message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'message': (BuildContext context) => MessageScreen()
      },
    );
  }
}