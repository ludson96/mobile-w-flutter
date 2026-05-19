import 'dart:convert';
import 'dart:developer';

import 'package:app_social_login/main.dart';
import 'package:app_social_login/pages/messages.page.dart';
import 'package:app_social_login/pages/settings.page.dart';
import 'package:app_social_login/services/local_notification.service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FirebaseNotificationService {
  final LocalNotificationService _localNotificationService =
      GetIt.I<LocalNotificationService>();

  Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission(provisional: true);

    final fcmToken = await FirebaseMessaging.instance.getToken();

    log("TOKEN DE NOTIFICAÇÃO = $fcmToken");

    FirebaseMessaging.onMessage.listen(
      _localNotificationService.showLocalNotification,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(_onTapNotification);
  }

  void _onTapNotification(RemoteMessage message) {
    log("A notificação foi clicada");
    log(message.notification!.title!);
    log(message.notification!.body!);
    log(jsonEncode(message.data));

    final String? navigateTo = message.data['navigateTo'];

    if (navigateTo != null) {
      if (navigateTo == 'messages') {
        globalNavigatorKey.currentState?.pushReplacement(
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
}
