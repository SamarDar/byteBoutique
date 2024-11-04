import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant_data/const_data.dart';
import '../constant_data/shared_preferences_key.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveAccessToken(String token) async {
    await sharedPreferences.setString(SharedPreferencesKey.tokenKey, token);
    ConstData.token=token;
  }

  Future<void> saveIsLogin(String userId) async {
    await sharedPreferences.setString(SharedPreferencesKey.isLoginKey, userId);
    ConstData.userID=userId;
  }

  String? getAccessToken() {
    return sharedPreferences.getString(SharedPreferencesKey.tokenKey);
  }

  String? getIsLogin() {
    return sharedPreferences.getString(SharedPreferencesKey.isLoginKey);
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
