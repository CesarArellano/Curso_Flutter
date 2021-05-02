import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messsaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = new StreamController.broadcast(); // I need this property because I want to use it to navigate to any screen.
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${ message.data }');
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${ message.data }');
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future _onMessageOpenHandler(RemoteMessage message) async {
    print('onMessageOpen Handler ${ message.data }');
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');
    
    // Handlers (Escuchando notificaciones)
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenHandler);
  }
  
  static closeStreams() {
    _messageStream.close();
  }
}