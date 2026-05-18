import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  Future<void> initialize() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(provisional: true);

    final fcmToken = await FirebaseMessaging.instance.getToken();

    print("TOKEN DE NOTIFICAÇÃO = $fcmToken");
  }
}
