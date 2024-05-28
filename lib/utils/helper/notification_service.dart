// import 'dart:collection';
// import 'dart:io';
//
// import 'dart:math';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:get/get_utils/src/platform/platform.dart';
// import 'package:pixtra/data/model/notification_model.dart';
// import 'package:pixtra/utils/helper/storage_helper.dart';
// import 'package:pixtra/utils/routes.dart';
//
// class NotificationService {
//   //Singleton pattern
//   static final NotificationService _notificationService =
//       NotificationService._internal();
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   NotificationService._internal();
//
//   /// Create a [AndroidNotificationChannel] for heads up notifications
//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description: 'This channel is used for important notifications.',
//     // description
//     importance: Importance.high,
//   );
//
//   //instance of FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     await requestPermissions();
//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     initFirebaseListeners();
//     try {
//       String? token = await FirebaseMessaging.instance.getToken();
//       if (token != null) {
//         debugPrint("fcmToken = $token");
//         StorageHelper().saveFcmToken(token);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//
//
//   Future<bool?> requestPermissions() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/launcher_icon');
//
//     DarwinInitializationSettings initializationSettingsIOS =
//     DarwinInitializationSettings(
//         requestSoundPermission: true,
//         requestBadgePermission: true,
//         requestAlertPermission: true,
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS,
//         macOS: null);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onSelectNotification);
//     if (Platform.isIOS || Platform.isMacOS) {
//       Platform.isIOS?await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       ): await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//           MacOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//       flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>();
//       await androidImplementation?.createNotificationChannel(channel);
//       final bool? granted = await androidImplementation?.requestPermission();
//       print(granted);
//       return granted;
//     }
//     return false;
//   }
//
//   void initFirebaseListeners() {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       if (StorageHelper().getIsLoggedIn() == false) {
//         return;
//       }
//       print("Foreground notification opened${message.toMap()}");
//       NotificationModel notificationEntity =
//           NotificationModel.fromJson(message.data);
//       if (notificationEntity != null) {
//         pushNextScreenFromForeground(notificationEntity);
//       }
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print("Foreground notification received");
//       if (StorageHelper().getIsLoggedIn() == false) {
//         return;
//       }
//       if (GetPlatform.isIOS) {
//         print("Foreground notification received data : ${message.toMap()}");
//         return;
//       }
//       NotificationModel notificationEntity =
//           NotificationModel.fromJson(message.data);
//       print("Foreground notification received data : ${message.toMap()}");
//       showNotifications(notificationEntity);
//     });
//   }
//
//   Future? onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     if (StorageHelper().getUserToken() == null) {
//       return null;
//     }
//     NotificationModel? entity =
//         StorageHelper().convertStringToNotificationModel(payload);
//     if (entity != null) {
//       pushNextScreenFromForeground(entity);
//     }
//   }
//
//   Future? onSelectNotification(NotificationResponse notificationResponse) {
//     if (StorageHelper().getUserToken() == null) {
//       return null;
//     }
//     NotificationModel? entity = StorageHelper()
//         .convertStringToNotificationModel(notificationResponse.payload);
//     if (entity != null) {
//       pushNextScreenFromForeground(entity);
//     }
//   }
//
//   Future<void> showNotifications(NotificationModel notificationModel) async {
//     Random random = Random();
//     int id = random.nextInt(900) + 10;
//     await flutterLocalNotificationsPlugin.show(
//         id,
//         notificationModel.title,
//         notificationModel.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon:"@mipmap/launcher_icon",
//             channelShowBadge: true,
//             playSound: true,
//             priority: Priority.high,
//             importance: Importance.high,
//             styleInformation:
//                 BigTextStyleInformation(notificationModel.body ?? ""),
//           ),
//         ),
//         payload: StorageHelper()
//             .convertNotificationModelToString(notificationModel));
//   }
//
//   Future<Map<String, dynamic>?> getPushNotificationRoute() async {
//     RemoteMessage? remoteMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     NotificationModel? entity;
//     if (remoteMessage != null && remoteMessage.data.isNotEmpty) {
//       print("RemoteMessage data" + remoteMessage.data.toString());
//       entity = NotificationModel.fromJson(remoteMessage.data);
//       return await callApi(entity);
//     } else if (notificationAppLaunchDetails != null &&
//         notificationAppLaunchDetails.didNotificationLaunchApp == true) {
//       entity = StorageHelper().convertStringToNotificationModel(
//           notificationAppLaunchDetails.notificationResponse?.payload);
//       if (entity != null) {
//         print("RemoteMessage data" + entity.toJson().toString());
//         return await callApi(entity);
//       } else {
//         return null;
//       }
//     } else {
//       return null;
//     }
//   }
//
//   void pushNextScreenFromForeground(NotificationModel? entityName) async {
//     Map<String, dynamic>? map = await callApi(entityName!);
//     if (map != null) {
//       if (StorageHelper().getUserType() == "client") {
//         // Get.toNamed(map['screen'], arguments: map['args']);
//       } else {
//         // Get.toNamed(map['screen'], arguments: map['args']);
//       }
//     }
//   }
//
//   Future<Map<String, Object>?> callApi(NotificationModel entity) async {
//     Map<String, Object> data = HashMap();
//     if (StorageHelper().getUserType() == "client") {
//       data['screen'] = Routes.clientMainScreen;
//       data['args'] = 0;
//       return data;
//     } else {
//       data['screen'] = Routes.photographerMainScreen;
//       data['args'] = 0;
//       return data;
//     }
//   }
//
// }
