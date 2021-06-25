import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/urls.dart';
import 'package:flutterboiler/utils/print_utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationUtils {
  static var subscriptionNotif;

  static subsNotif() async {
    if (subscriptionNotif == null) {
      subscriptionNotif = WebSocketChannel.connect(
        // Uri.parse(Config.baseNotif + userId),
        Uri.parse(Urls.baseNotif),
      );
      PrintUtils.printGreen("Conection Open for notif main");
      int idnotif = 0;

      if (subscriptionNotif != null) {
        subscriptionNotif.stream.listen(
          (message) {
            try {
              idnotif++;
              PrintUtils.printWarning("NOTIF in main>>> " + message);
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
      }
    }
  }

  static closeConnection() {
    PrintUtils.printError('Connection Closed for notif main');
    try {
      subscriptionNotif.sink.close();
      subscriptionNotif = null;
    } catch (e) {
      PrintUtils.printError(e.toString());
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
