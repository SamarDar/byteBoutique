import 'dart:async';

class ConstData {
  static bool isLogin = false;
  static String token = "";
  static String fcm_token = "";
  static String userID = "";
  static const String map_key = "";


  static Future<void> UpdateToken() async {}

  static Future<void> startTokenupdater() async {
    Timer.periodic(Duration(seconds: 20), (timer) {
      UpdateToken();
    });
  }
}
