import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'basic notifocation',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(
        0, 'basic notification', 'body', details,
        payload: 'payload data');
  }

  static void showrepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'repeated notifocation',
            importance: Importance.max, priority: Priority.high));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        1, 'basic notification', 'body', RepeatInterval.everyMinute, details,
        payload: 'payload data');
  }
//time zoon package
  // static void showSheduledNotification() async {
  //   NotificationDetails details = const NotificationDetails(
  //       android: AndroidNotificationDetails('id 3', 'scheduled notifocation',
  //           importance: Importance.max, priority: Priority.high));
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       2, 'scheduled notifocation', 'body', scheduledDate, details,
  //       uiLocalNotificationDateInterpretation:
  //        UILocalNotificationDateInterpretation.absoluteTime);
  // }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}




//1.setup done
//2. basic notification
//3. repeat notification
//4. schedule notification
//5. cancel notification
