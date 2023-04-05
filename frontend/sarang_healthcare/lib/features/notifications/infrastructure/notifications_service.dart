import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

var initializationSettingsIOS = DarwinInitializationSettings(
  requestAlertPermission: true,
  requestBadgePermission: true,
  requestSoundPermission: true,
  onDidReceiveLocalNotification: (id, title, body, payload) {},
);

class NotificationsService {
  Future<void> initializeNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  void sendNotification(String appointmentDate, String appointmentTime) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentSound: true,
      ),
    );

    String dateString = appointmentDate;
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
    String outputDate = DateFormat('yyyy-MM-dd').format(dateTime);

    final scheduledDate = DateTime.parse('$outputDate $appointmentTime:00');
    final scheduledTime = scheduledDate.subtract(const Duration(minutes: 20));

    // Get the local timezone
    tz.initializeTimeZones();
    final location = tz.local;

    // Convert the scheduled time to the local timezone
    final scheduledTimezone = tz.TZDateTime.from(scheduledTime, location);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Appointment Reminder',
      'You have an appointment in 20 minutes!',
      scheduledTimezone,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
