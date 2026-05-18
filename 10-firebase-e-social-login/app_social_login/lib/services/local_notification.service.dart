import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final _pluginNotification = FlutterLocalNotificationsPlugin();

  LocalNotificationService() {
    initialize();
  }

  Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await _pluginNotification.initialize(settings: initializationSettings);
  }

  void showLocalNotification(RemoteMessage remoteMessage) {}
}
