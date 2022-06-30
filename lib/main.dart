import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/initializer.dart';
import 'package:ostadjee/app/common/values/strings.dart';
import 'package:ostadjee/app/common/values/styles/theme.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const MyApp());
  });
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel',
//   'High Importance Notifications',
//   description: 'This channel is used for important notifications.',
//   importance: Importance.high,
// );

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   // setupFirebase();

  //   super.initState();
  // }

  // setupFirebase() async {
  //   if (Platform.isIOS) {
  //     // requestForIos();
  //   }

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // await FirebaseMessaging.instance
  //     .setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  // await FirebaseMessaging.instance.subscribeToTopic('ostadjee');

  // FirebaseMessaging.instance.getInitialMessage();

  // FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
  //   RemoteNotification? notification = message?.notification;
  //   AndroidNotification? android = message?.notification?.android;

  //   if (notification != null && android != null) {
  //     flutterLocalNotificationsPlugin.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             channelDescription: channel.description,
  //             styleInformation: const BigTextStyleInformation(''),
  //             icon: '@mipmap/launcher_icon',
  //           ),
  //         ));
  //   }
  // });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     Get.toNamed(Routes.SPLASH);
  //   });
  // }

  // requestForIos() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: 300,
        maxHeight: 600,
        // maxWidth: Get.width,
        // maxHeight: Get.height,
      ),
      // designSize: Get.size,
    );

    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: const DummyScreen(),
    );
  }
}
