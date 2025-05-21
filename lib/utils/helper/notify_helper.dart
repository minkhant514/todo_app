import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';

void backgroundHandler(NotificationResponse notificationResponse) {
  print('Notification received in background: ${notificationResponse.payload}');
  if (notificationResponse.payload == 'navigate') {
    print('Performing navigation action based on notification payload.');
  }
}

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  void initializeNotification() async {
    tz.initializeTimeZones();

    // this is android setting
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("todo_logo");

    // this is for latest iOS settings
    // final DarwinInitializationSettings initializationSettingsIOS =
    //     DarwinInitializationSettings(
    //         requestSoundPermission: false,
    //         requestBadgePermission: false,
    //         requestAlertPermission: false,
    //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      // iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: selectNotification
      onDidReceiveBackgroundNotificationResponse: backgroundHandler,
    );
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title),
    //     content: Text(body),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: Text('Ok'),
    //         onPressed: () async {
    //           Navigator.of(context, rootNavigator: true).pop();
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SecondScreen(payload),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );

    Get.dialog(Text("Welcome to Flutter"));
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(() => Container(
          color: Colors.red,
        ));
  }

  // void requestIOSPermissions() {
  //   flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           IOSFlutterLocalNotificationsPlugin>()
  //       ?.requestPermissions(
  //         alert: true,
  //         badge: true,
  //         sound: true,
  //       );
  // }

  void requestAndroidPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> displayNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    print("doing test");

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Channel_id',
      'Chennel_title',
      importance: Importance.max,
      priority: Priority.high,
      icon: "todo_logo",
      largeIcon: DrawableResourceAndroidBitmap("todo_logo"),
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      payload: payload,
      notificationDetails,
    );
  }

  Future scheduledNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    return flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        payload: payload,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        await NotificationDetails(
          android: AndroidNotificationDetails(
            'Channel_id',
            'Channel_name',
            channelDescription: 'your channel discription',
          ),
        ),
        // androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
