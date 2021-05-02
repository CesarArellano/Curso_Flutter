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

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();
  
  @override
  void initState() { 
    super.initState();
    PushNotificationService.messagesStream.listen((message) {
      print(message);
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar); // ? Si no está inicializado no hará esta instrucción.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, //Navegar a otra pantalla mediante una notificación.
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'message': (BuildContext context) => MessageScreen()
      },
    );
  }
}