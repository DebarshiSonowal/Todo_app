import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    // Android initialization
    tz.initializeTimeZones();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios initialization
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin
        .zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(
          seconds: 1)), //schedule the notification to show after 2 seconds.
      const NotificationDetails(
        // Android details
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            importance: Importance.max,
            priority: Priority.max),
        // iOS details
        iOS: DarwinNotificationDetails(
          // sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),

      // Type of time interpretation
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
          true, // To show notification even when the app is closed
    )
        .then((value) {
      debugPrint("Scheduled");
    });
  }

  Future<void> showNotificationStrict(int id, String title, String body,
      int seconds, bool vibration, String sound) async {
    debugPrint("Scheduled sound ${sound} ${sound == "NA" ? "alarm_clock" : sound}");
    await flutterLocalNotificationsPlugin
        .zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      //schedule the notification to show after 2 seconds.
      NotificationDetails(
        // Android details
        android: AndroidNotificationDetails(
          'main_channel3',
          'Main Channel4',
          channelDescription: "Shows Reminder Notification",
          importance: Importance.high,
          priority: Priority.max,
          playSound: true,
          enableVibration: vibration ?? false,
          sound: RawResourceAndroidNotificationSound(sound),
          // sound: UriAndroidNotificationSound(
          //     "assets/audio/${sound == "NA" ? "alarm_clock" : sound}.mp3"),
        ),
        // iOS details
        iOS: const DarwinNotificationDetails(
          // sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),

      // Type of time interpretation
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
          true, // To show notification even when the app is closed
    )
        .then((value) {
      debugPrint("Scheduled");
    });
  }

  scheduledNotification({
    required int hour,
    required int minutes,
    required int id,
    required String sound,
    required year,
    required month,
    required day,
  }) async {
    await flutterLocalNotificationsPlugin
        .zonedSchedule(
      id,
      'It\'s time to drink water!',
      'After drinking, touch the cup to confirm',
      _convertTime(
        hour,
        minutes,
        year,
        month,
        day,
      ),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id $sound',
          'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          // sound: RawResourceAndroidNotificationSound(sound),
        ),
        // iOS: DarwinNotificationDetails(sound: '$sound'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'It could be anything you pass',
    )
        .then((value) {
      debugPrint("Notification swt ${_convertTime(
        hour,
        minutes,
        year,
        month,
        day,
      )}");
    });
  }

  tz.TZDateTime _convertTime(
    int hour,
    int minutes,
    year,
    month,
    day,
  ) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      year,
      month,
      day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }
}
