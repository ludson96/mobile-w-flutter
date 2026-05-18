import 'package:app_social_login/services/local_notification.service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  final LocalNotificationService _localNotificationService =
      LocalNotificationService();

  Future<void> initialize() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(provisional: true);

    final fcmToken = await FirebaseMessaging.instance.getToken();

    print("TOKEN DE NOTIFICAÇÃO = $fcmToken");

    FirebaseMessaging.onMessage.listen(
      _localNotificationService.showLocalNotification,
    );
  }
}
