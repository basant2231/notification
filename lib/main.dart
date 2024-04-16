import 'package:flutter/material.dart';

import '../local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotificationScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.title});

  final String title;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              LocalNotificationService.showBasicNotification();
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Basic Notification'),
            trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.cancelNotification(0);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                )),
          ),
          ListTile(
            onTap: () {
              LocalNotificationService.showrepeatedNotification();
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Repeated Notification'),
            trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.cancelNotification(1);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                )),
          ),
          ListTile(
            onTap: () {
              LocalNotificationService.showSheduledNotification();
            },
            leading: const Icon(Icons.notifications),
            title: const Text('Scheduled Notification'),
            trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.cancelNotification(2);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}

//local notification
//from my device
//push notification
//from the server
