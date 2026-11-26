import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'DetailScreen.dart';
import 'InputScreen.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      final payload = response.payload;
      if (payload != null) {
        navigatorKey.currentState?.push(MaterialPageRoute(
          builder: (_) => DetailScreen(payload: payload),
        ));
      }
    },
  );

  final launch = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  runApp(MyApp(payload: launch?.didNotificationLaunchApp == true
      ? launch?.notificationResponse?.payload : null));
}

class MyApp extends StatelessWidget {
  final String? payload;

  const MyApp({super.key, this.payload});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Reminder App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: payload == null ? '/' : '/detail',
      routes: {
        '/': (context) => InputScreen(),
        '/detail': (context) => DetailScreen(payload: payload ?? ''),
      },
    );
  }
}
