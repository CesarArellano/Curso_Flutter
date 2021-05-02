import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messsaging = FirebaseMessaging.instance;
  static String? token;

  static Future _onBackgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${ message.messageId }');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${ message.messageId }');
  }

  static Future _onMessageOpenHandler(RemoteMessage message) async {
    print('onMessageOpen Handler ${ message.messageId }');
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
}

// eAKR8LoDTaGlnRN0FTGCSD:APA91bGOVkdJTAMG5iO9MWzwcEH8yG3SEDChKTpn9yWQiQ6Zkw02zXTIQvxvkKE2VAW8c7N-U8rt-_RGu5pqp13yTw_gYfZpLzgk3qqxVaZwDrWcxipYNlTpE7Hy_dTn7CuKfJUGKNZz