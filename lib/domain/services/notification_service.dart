import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../core/constants/app_constants.dart';

/// Manages local notifications for the daily flow.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  NotificationService() : _plugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    if (_initialized) return;

    try {
      tz.initializeTimeZones();

      const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
      const initSettings = InitializationSettings(android: androidSettings);

      await _plugin.initialize(initSettings);

      // Request notification permission on Android 13+
      final android = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      try {
        await android?.requestNotificationsPermission();
      } catch (_) {
        // Some devices reject this — continue without notifications
      }
      try {
        await android?.requestExactAlarmsPermission();
      } catch (_) {
        // MIUI and some OEMs block exact alarms — use inexact instead
      }

      _initialized = true;
    } catch (_) {
      // Notification init failed — app continues without notifications
      _initialized = true;
    }
  }

  /// Schedule the morning notification at the given time (default 8:00).
  Future<void> scheduleMorningNotification({int hour = 8, int minute = 0}) async {
    await _scheduleDaily(
      id: AppConstants.morningNotificationId,
      hour: hour,
      minute: minute,
      title: 'Buenos dias',
      body: 'Vamos a preparar todo para empezar el dia.',
    );
  }

  /// Schedule a reminder for a specific block.
  Future<void> scheduleBlockReminder({
    required int blockIndex,
    required String blockName,
    required String scheduledTime,
  }) async {
    final parts = scheduledTime.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    await _scheduleDaily(
      id: AppConstants.block0ReminderId + blockIndex,
      hour: hour,
      minute: minute,
      title: blockName,
      body: 'Es hora de tu siguiente actividad.',
    );
  }

  /// Schedule the evening questionnaire reminder at the given time (default 20:30).
  Future<void> scheduleEveningReminder({int hour = 20, int minute = 30}) async {
    await _scheduleDaily(
      id: AppConstants.eveningQuestionnaireReminderId,
      hour: hour,
      minute: minute,
      title: 'Cierre del dia',
      body: 'Vamos a hacer el cuestionario del final del dia.',
    );
  }

  /// Reschedule morning and evening notifications with new times.
  Future<void> reschedule({
    required int morningHour,
    required int morningMinute,
    required int eveningHour,
    required int eveningMinute,
  }) async {
    await scheduleMorningNotification(hour: morningHour, minute: morningMinute);
    await scheduleEveningReminder(hour: eveningHour, minute: eveningMinute);
  }

  /// Cancel a specific notification.
  Future<void> cancel(int id) async {
    await _plugin.cancel(id);
  }

  /// Cancel all notifications.
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  /// Show an immediate notification.
  Future<void> showNow({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'appbuelito_general',
      'Appbuelito',
      channelDescription: 'Notificaciones de Appbuelito',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);
    await _plugin.show(id, title, body, details);
  }

  Future<void> _scheduleDaily({
    required int id,
    required int hour,
    required int minute,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'appbuelito_daily',
      'Rutina diaria',
      channelDescription: 'Recordatorios de la rutina diaria',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If time already passed today, schedule for tomorrow
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
