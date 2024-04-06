import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../main.dart';
import '../presentation/log_in_screen/log_in_screen.dart';

class NotificationService {
  // Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = "1";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    "thecodexhub",
    channelDescription:
        "This channel is responsible for all the local notifications",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  static final DarwinNotificationDetails _DarwinNotificationDetails =
      DarwinNotificationDetails();

  final NotificationDetails notificationDetails = NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _DarwinNotificationDetails,
  );

  Future<void> init() async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      defaultPresentAlert: false,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    // *** Initialize timezone here ***
    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        onSelectNotification(response.payload);
      },
    );
  }

  Future<void> requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(
      int id, String title, String body, String payload) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> scheduleNotification(int id, String title, String body,
      DateTime eventDate, TimeOfDay eventTime, String payload,
      [DateTimeComponents? dateTimeComponents]) async {
    final scheduledTime = eventDate.add(Duration(
      hours: eventTime.hour,
      minutes: eventTime.minute,
    ));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: payload,
      matchDateTimeComponents: dateTimeComponents,
    );
  }

  Future<void> repeatingNotification(
      int id,
      String title,
      String body,
      DateTime eventDate,
      TimeOfDay eventTime,
      String payload,
      List<DayInWeek> days,
      [DateTimeComponents? dateTimeComponents]) async {
    //convert days to a set a repeating scheduled events on a weekly basis
    //time to schedule activity, being the day plus the time in hours and minutes
    const Map<String, int> daysOfWeek = {
      "monday": 1,
      "tuesday": 2,
      "wednesday": 3,
      "thursday": 4,
      "friday": 5,
      "saturday": 6,
      "sunday": 7,
    };
    for (final day in days) {
      //this is our day of the week, a number starting at 1 for monday and 7 for sunday
      int daynum = daysOfWeek[day]!;
      int todayoffset = (daynum % 7) + 1;
      //offset the modified date to accomodate weekday
      final finalDate = eventDate.add(Duration(days: todayoffset));
      dateTimeComponents = DateTimeComponents.dayOfWeekAndTime;
      scheduleNotification(
          id, title, body, finalDate, eventTime, payload, dateTimeComponents);
    }
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

Future<void> onSelectNotification(String? payload) async {
  Future<void> navigateToLoginPage(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => LoginPage()));
  }
}
