import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Urls.dart';
import 'package:flutterboiler/Utils/PrintUtils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationUtils {
  static subsNotif() async {
    try {
      var idnotif = 0;
      var subscriptionNotif = WebSocketChannel.connect(
        // Uri.parse(Config.baseNotif + iduser),
        Uri.parse(Urls.baseNotif),
      );
      subscriptionNotif.stream.listen(
        (message) {
          try {
            PrintUtils.printWarning('>>>Received Message from ws : $message');
            idnotif++;
            var messagefix = json.decode(message);
            if (messagefix['message'] != null) {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: idnotif,
                  channelKey: 'basic_channel',
                  title: 'Notifikasi',
                  body: messagefix['message'],
                ),
              );
            }
          } catch (e) {
            print(e);
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static initNotif() async {
    try {
      AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xffd7b770),
            ledColor: Colors.white,
          )
        ],
      );
      AwesomeNotifications().isNotificationAllowed().then(
        (isAllowed) {
          if (!isAllowed) {
            AwesomeNotifications().requestPermissionToSendNotifications();
          }
        },
      );
      NotificationUtils.subsNotif();
    } catch (e) {
      print(e);
    }
  }
}
