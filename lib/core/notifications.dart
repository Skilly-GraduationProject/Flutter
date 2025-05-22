// import 'dart:io'; // Required for platform checks
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:grad_project/core/helper/service_locator.dart';
// import 'package:grad_project/core/keys.dart';
// import 'package:grad_project/core/secure_storage_helper.dart';

// // Class to manage local notifications
// class LocalNotification {
//   // Initialize local notification plugin and Firebase messaging
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initialize() async {
//     // Initialize Firebase
//     await Firebase.initializeApp();
//     // Request notification permission
//     await _requestNotificationPermission();
//     // Save FCM token in secure storage
//     await _saveFcmToken();
//     // Initialize notification settings for Android and iOS
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       requestCriticalPermission: true,
//       requestProvisionalPermission: true,
      
//       // onDidReceiveLocalNotification:
//       //     (int id, String? title, String? body, String? payload) async {
//       //   // Handle iOS notification in foreground
//       //   print(
//       //       'iOS local notification received: ID=$id, Title=$title, Body=$body, Payload=$payload');
//       // },
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     // Initialize flutterLocalNotificationsPlugin
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // Register background message handler
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // Listen to foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print(
//           "Foreground notification received! Notification body: ${message.notification?.body}");
//       await _displayNotification(
//         flutterLocalNotificationsPlugin,
//         message.notification?.title ?? 'Notification',
//         message.notification?.body ?? 'Body',

//       );
//     });
//   }

//   // Background handler for notifications
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp();
//     print("Handling background notification: ${message.messageId}");
//     // Show notification when the app is in the background
//     await LocalNotification()._displayNotification(
//       FlutterLocalNotificationsPlugin(),
//       message.notification?.title ?? 'Notification',
//       message.notification?.body ?? 'Body',
//     );
//   }

//   // Request permission for notifications
//   Future<void> _requestNotificationPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       sound: true,

//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission: ${settings.authorizationStatus}');
//     } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//       print('User denied permission');
//     }

//     // iOS-specific request
//     if (Platform.isIOS) {
//       FirebaseMessaging.instance.requestPermission();
//     }

//     // Subscribe to a topic if necessary
//     messaging.subscribeToTopic("all");

//     // Set options to show notifications in the foreground
//     await messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,

//     );
//   }

//   // Display notification
//   Future<void> _displayNotification(
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
//     String title,
//     String body,
//   ) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'your_channel_id', // Channel ID for Android notifications
//       'your_channel_name', // Channel name for Android notifications
//       icon: '@mipmap/ic_launcher',
//       importance: Importance.max,
//       priority: Priority.high,
//       visibility: NotificationVisibility.public,
//     );

//     const NotificationDetails platformDetails = NotificationDetails(
//       android: androidDetails,
//       iOS: DarwinNotificationDetails(), // iOS settings
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       title,
//       body,
//       platformDetails,
//     );
//   }

//   Future<void> _saveFcmToken() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     String? fcmToken = await messaging.getToken();
//     print('FCM Token: $fcmToken'); // Get FCM token
//     await getIt<SecureStorageHelper>().write(
//         key: Keys.fcmToken,
//         value: fcmToken!); // Save FCM token in secure storage
//   }
// }
