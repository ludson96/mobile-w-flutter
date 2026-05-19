import 'dart:convert';

import 'package:app_social_login/main.dart';
import 'package:app_social_login/pages/messages.page.dart';
import 'package:app_social_login/pages/settings.page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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

    await _pluginNotification.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        if (notificationResponse.payload != null) {
          final payload = jsonDecode(notificationResponse.payload!);
          final navigateTo = payload['navigateTo'];

          if (navigateTo != null) {
            if (navigateTo == 'messages') {
              // globalNavigatorKey.currentState?.pushReplacement(
              //   MaterialPageRoute(builder: (context) => const MessagePage()),
              // );
              Navigator.pushReplacement(
                globalNavigatorKey.currentState!.context,
                MaterialPageRoute(builder: (context) => const MessagePage()),
              );
            }
          }

          if (navigateTo != null) {
            if (navigateTo == 'settings') {
              globalNavigatorKey.currentState?.pushReplacement(
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            }
          }
        }
      },
    );
  }

  void showLocalNotification(RemoteMessage remoteMessage) {
    final notification = remoteMessage.notification;

    if (notification == null) return;

    AndroidNotificationDetails? androidNotification;

    if (notification.android != null) {
      androidNotification = AndroidNotificationDetails(
        'fase-8-teste',
        'App Fase 8',
        importance: .max,
        priority: .max,
        icon: notification.android!.smallIcon,
      );
    }

    final notificationDetails = NotificationDetails(
      android: androidNotification,
    );

    _pluginNotification.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: notificationDetails,
      payload: jsonEncode(remoteMessage.data),
    );
  }
}
