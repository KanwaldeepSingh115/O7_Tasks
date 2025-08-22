import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications extends StatefulWidget {
  const LocalNotifications({super.key});

  @override
  State<LocalNotifications> createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const settings = InitializationSettings(android: androidInit, iOS: iosInit);

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (resp) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ReminderScreen()),
        );
      },
    );

    // iOS only (Android auto-handles it)

    // await _notifications
    //     .resolvePlatformSpecificImplementation<
    //       IOSFlutterLocalNotificationsPlugin
    //     >()
    //     ?.requestPermissions(alert: true, badge: true, sound: true);
  }

   
  Future<void> _showNow() async {
    await _notifications.show(
      1,
      'Hello!',
      'This is an instant notification 🚀',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'instant_channel',
          'Instant Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Local Notifications Demo')),
        body: Center(
          child: ElevatedButton(
            onPressed: _showNow,
            child: const Text("Show Now"),
          ),
        ),
      ),
    );
  }
}

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reminder Opened")),
      body: const Center(child: Text("You tapped the notification! 🎉")),
    );
  }
}
