import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:focalx_task6/core/constant_data/const_data.dart';
import 'package:get/get.dart';
import '../../../core/classes/crud.dart';
import '../../../core/classes/status_requests.dart';
import '../../../core/constant_data/link.dart';
import '../../../core/services/myServices.dart';
import '../../customePageView/screen/custom_page_view.dart';

class SignInController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final MyServices myServices = Get.find<MyServices>();
  Map<String, String> headers = AppLink.getHeader();
  final Crud _crud = Get.find<Crud>();
  String url = AppLink.login;
  bool isLoading = false;
  bool obscure = true;

  obscureFunc() {
    obscure = !obscure;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> signIn() async {
    _setLoading(true);
    final fcmToken = await FirebaseMessaging.instance.getToken();

    if (fcmToken == null) {
      _setLoading(false);
      Get.snackbar('Error', 'Failed to get FCM token');


      return;
    }

    ConstData.fcm_token=fcmToken!;

    Map<String, dynamic> requestData = {
      "email": emailController.text,
      "password": passwordController.text,
      "fcm_token": fcmToken,
    };

    print("Request Data: ${jsonEncode(requestData)}");
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    print("FCM Token: $fcmToken");
    print("fcmToken=========================${ConstData.fcm_token}");

    Either<StatusRequest, dynamic> response = await _crud.postDate(
      url,
      requestData,
      headers,
    );

    return response.fold(
      (status) {
        _setLoading(false);
        if (status == StatusRequest.offlineFailure) {
          Get.snackbar("Error", "You are offline");
        } else if (status == StatusRequest.serverFailure) {
          Get.snackbar('Error', 'log in failed');
        }
        return {};
      },
      (responseBody) {
        try {
          if (responseBody == null) {
            throw Exception('Empty response from server');
          }
          print("Response Body: $responseBody");

          if (responseBody.containsKey('data') &&
              responseBody['data'].containsKey('access_token')) {
            final accessToken = responseBody['data']['access_token'];
            final user = responseBody['data']['user'];
            final message = responseBody['message'];

            myServices.saveAccessToken(accessToken);
            myServices.saveIsLogin(ConstData.userID);
            print("User: $user");

            _setLoading(false);
            Get.offAll(() => const CustomPageView());

            Get.snackbar('Success', message);
            print(responseBody);
            return responseBody;
          } else {
            throw Exception('Unexpected response structure');
          }
        } catch (e) {
          _setLoading(false);
          Get.snackbar('Error', 'Failed to process log in response: $e');
          print("============================================$e");
        }
      },
    );
  }
}
