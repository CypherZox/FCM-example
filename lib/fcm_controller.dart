import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// late FlutterLocalNotificationsPlugin fltNotification ;
class FCMService {
  static final fltNotification = FlutterLocalNotificationsPlugin();
  static const AndroidNotificationDetails _androidDetails =
      AndroidNotificationDetails(
    "1",
    "name",
    channelDescription:
        "This channel is responsible for all the local notifications",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );
  static const generalNotificationDetails =
      NotificationDetails(android: _androidDetails, iOS: _iOSDetails);

  static const IOSNotificationDetails _iOSDetails = IOSNotificationDetails();

  Future<void> initNotification() async {
    const iosInit = IOSInitializationSettings();
    const androiInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSetting =
        InitializationSettings(android: androiInit, iOS: iosInit);
    await fltNotification.initialize(initSetting);
    final generalNotificationDetails =
        NotificationDetails(android: _androidDetails, iOS: _iOSDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("meassgae recieved");
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails);
      }
    });
  }

  // Future<void> handleFireBaseBackground(RemoteMessage message) async {
  //   final generalNotificationDetails =
  //       NotificationDetails(android: _androidDetails, iOS: _iOSDetails);
  //   RemoteNotification notification = message.notification!;
  //   AndroidNotification android = message.notification!.android!;
  //   if (notification != null && android != null) {
  //     await fltNotification.show(notification.hashCode, notification.title,
  //         notification.body, generalNotificationDetails);
  //   }
  // }
}
