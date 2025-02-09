// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await NotificationService.instance.setupFlutterNotifications();
//   await NotificationService.instance.showNotifications(message, showOnScreen: true);
// }
//
// class NotificationService {
//   NotificationService._();
//   static final NotificationService instance = NotificationService._();
//
//   final _messaging = FirebaseMessaging.instance;
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//   bool _isFlutterLocalNotificationInitialized = false;
//
//   Future<void> initialize() async {
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     await _requestPermission();
//     await _setupMessageHandlers();
//     await setupFlutterNotifications();
//     final token = await _messaging.getToken();
//     print('FCM Token: $token');
//   }
//
//   Future<void> _requestPermission() async {
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     print("Permission status: ${settings.authorizationStatus}");
//   }
//
//   Future<void> setupFlutterNotifications() async {
//     if (_isFlutterLocalNotificationInitialized) {
//       return;
//     }
//
//     // Android notification channel setup
//     const channel = AndroidNotificationChannel(
//       'default_channel', // Channel ID
//       'Default Notifications',
//       description: 'This channel is used for default notifications.',
//       importance: Importance.high,
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     const initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     final initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//
//     await _localNotifications.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (details) {
//           // Handle notification tap
//           print("Notification tapped with payload: ${details.payload}");
//         });
//
//     _isFlutterLocalNotificationInitialized = true;
//   }
//
//   Future<void> showNotifications(RemoteMessage message,
//       {bool showOnScreen = false}) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//
//     if (notification != null && android != null) {
//       if (showOnScreen) {
//         // Show notification on the screen (popup)
//         await _localNotifications.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               'default_channel', // Channel ID
//               'Default Notifications',
//               channelDescription: 'This channel is used for default notifications.',
//               importance: Importance.high,
//               priority: Priority.high,
//               icon: '@mipmap/ic_launcher',
//             ),
//           ),
//           payload: message.data.toString(),
//         );
//       } else {
//         // Only add notification to the notification tray
//         print("Notification added to tray: ${notification.title}");
//       }
//     }
//   }
//
//   Future<void> _setupMessageHandlers() async {
//     // Foreground message handling
//     FirebaseMessaging.onMessage.listen((message) {
//       showNotifications(message, showOnScreen: true);
//     });
//
//     // Background message handling
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
//
//     // App opened from terminated state
//     final initialMessage = await _messaging.getInitialMessage();
//     if (initialMessage != null) {
//       _handleBackgroundMessage(initialMessage);
//     }
//   }
//
//   void _handleBackgroundMessage(RemoteMessage message) {
//     showNotifications(message, showOnScreen: true);
//   }
// }
// // if i use this code that show err give correct code ?
//
//
//
//
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //
// // @pragma('vm:entry-point')
// // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// //   await NotificationService.instance.setupFlutterNotifications();
// //   await NotificationService.instance.showNotifications(message, showOnScreen: false);
// // }
// //
// // class NotificationService {
// //   NotificationService._();
// //   static final NotificationService instance = NotificationService._();
// //
// //   final _messaging = FirebaseMessaging.instance;
// //   final _localNotifications = FlutterLocalNotificationsPlugin();
// //   bool _isFlutterLocalNotificationInitialized = false;
// //
// //   Future<void> initialize() async {
// //     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// //     await _requestPermission();
// //     await _setupMessageHandlers();
// //     await setupFlutterNotifications();
// //     final token = await _messaging.getToken();
// //     print('FCM Token: $token');
// //   }
// //
// //   Future<void> _requestPermission() async {
// //     final settings = await _messaging.requestPermission(
// //       alert: true,
// //       badge: true,
// //       sound: true,
// //     );
// //     print("Permission status: ${settings.authorizationStatus}");
// //   }
// //
// //   Future<void> setupFlutterNotifications() async {
// //     if (_isFlutterLocalNotificationInitialized) {
// //       return;
// //     }
// //
// //     // Android notification channel setup
// //     const channel = AndroidNotificationChannel(
// //       'default_channel', // Channel ID
// //       'Default Notifications',
// //       description: 'This channel is used for default notifications.',
// //       importance: Importance.high,
// //     );
// //
// //     await _localNotifications
// //         .resolvePlatformSpecificImplementation<
// //         AndroidFlutterLocalNotificationsPlugin>()
// //         ?.createNotificationChannel(channel);
// //
// //     const initializationSettingsAndroid =
// //     AndroidInitializationSettings('@mipmap/ic_launcher');
// //
// //     final initializationSettings = InitializationSettings(
// //       android: initializationSettingsAndroid,
// //     );
// //
// //     await _localNotifications.initialize(initializationSettings,
// //         onDidReceiveNotificationResponse: (details) {
// //           // Handle notification tap
// //           print("Notification tapped with payload: ${details.payload}");
// //         });
// //
// //     _isFlutterLocalNotificationInitialized = true;
// //   }
// //
// //   Future<void> showNotifications(RemoteMessage message,
// //       {bool showOnScreen = false}) async {
// //     RemoteNotification? notification = message.notification;
// //     AndroidNotification? android = message.notification?.android;
// //
// //     if (notification != null && android != null) {
// //       await _localNotifications.show(
// //         notification.hashCode,
// //         notification.title,
// //         notification.body,
// //         NotificationDetails(
// //           android: AndroidNotificationDetails(
// //             'default_channel', // Channel ID
// //             'Default Notifications',
// //             channelDescription: 'This channel is used for default notifications.',
// //             importance: Importance.high,
// //             priority: Priority.high,
// //             icon: '@mipmap/ic_launcher',
// //           ),
// //         ),
// //         payload: message.data.toString(),
// //       );
// //     }
// //   }
// //
// //   Future<void> _setupMessageHandlers() async {
// //     // Foreground message handling
// //     FirebaseMessaging.onMessage.listen((message) {
// //       showNotifications(message, showOnScreen: true);
// //     });
// //
// //     // App opened from background or terminated state
// //     FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
// //
// //     // App opened from terminated state
// //     final initialMessage = await _messaging.getInitialMessage();
// //     if (initialMessage != null) {
// //       _handleBackgroundMessage(initialMessage);
// //     }
// //   }
// //
// //   void _handleBackgroundMessage(RemoteMessage message) {
// //     print("Handling background message: ${message.notification?.title}");
// //     showNotifications(message, showOnScreen: false);
// //   }
// // }
