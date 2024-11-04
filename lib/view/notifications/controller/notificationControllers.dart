import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class NotificationsController extends GetxController{
  String? accessToken;


  Future<void> myRequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }


  void foreGroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        Get.snackbar(
          message.notification!.title ?? "Notification",
          message.notification!.body ?? "",
        );
      }
    });
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    if (message.notification != null) {
      print("Title: ${message.notification!.title}");
      print("Body: ${message.notification!.body}");
    }
  }


  Future<void> sendNotification(String token) async {
    if (accessToken == null) {
      await getAccessToken();
    }
    var headers = {
      "Authorization": "Bearer $accessToken",
      "Content-Type": "application/json",
    };
    var uri =
        "https://fcm.googleapis.com/v1/projects/focalxtasks/messages:send";
    var body = {
      "message": {
        "token": token,
        "notification": {
          "body": "Welcome to the Byte Boutique!",
          "title": "Byte Boutique ",
        },
      },
    };

    var request = http.Request("POST", Uri.parse(uri))
      ..headers.addAll(headers)
      ..body = json.encode(body);

    try {
      var response = await request.send();
      final resBody = await response.stream.bytesToString();
      print("Notification Response: $resBody");
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          "assets/focalxtasks-firebase-adminsdk-toriw-0690c20055.json");
      final accountCredentials =
      ServiceAccountCredentials.fromJson(json.decode(serviceAccountJson));
      const scopes = ["https://www.googleapis.com/auth/firebase.messaging"];
      final client = http.Client();

      try {
        final accessCredentials =
        await obtainAccessCredentialsViaServiceAccount(
            accountCredentials, scopes, client);
        accessToken = accessCredentials.accessToken.data;
        print("Access Token: $accessToken");
      } catch (e) {
        print("Error obtaining access credentials: $e");
      } finally {
        client.close();
      }
    } catch (e) {
      print("Error loading service account JSON: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    myRequestPermission();
    getAccessToken();
    foreGroundNotification();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}