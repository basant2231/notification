import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse details) {}
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings());

    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic notification
  static void showBasicNotification() async {
    NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails('id 0', 'basic notifocation',
            importance: Importance.max,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound(
                'lib/assets/sound.mp3'.split('.').first)));
    await flutterLocalNotificationsPlugin.show(
        0, 'basic notification', 'body', details,
        payload: 'payload data');
  }

  static void showrepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'repeated notifocation',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, 'repeated notification', 'body', RepeatInterval.everyMinute, details,
        payload: 'payload data');
  }

  static void showSheduledNotification() async {
    tz.initializeTimeZones();
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'scheduled notifocation',
            importance: Importance.max, priority: Priority.high));
    log(tz.TZDateTime.now(tz.local).hour.toString());
    log(tz.local.toString());
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log(tz.TZDateTime.now(tz.local).hour.toString());
    log(tz.TZDateTime.now(tz.local).toString());

    flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        'scheduled notifocation',
        'boddkjnsjkgnsjky',
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        // 2 hours difference

        tz.TZDateTime(tz.local, 2024, 4, 17, 22, 50),
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}



//1.setup done
//2. basic notification
//3. repeat notification
//4. schedule notification
//5. cancel notification
