import 'package:dartz/dartz.dart';
import 'package:focalx_task6/view/sign_in/screen/sign_in_screen.dart';
import 'package:get/get.dart';
import '../../../core/classes/crud.dart';
import '../../../core/classes/status_requests.dart';
import '../../../core/constant_data/link.dart';
import '../../../core/services/myServices.dart';

class Drawercontroller extends GetxController {
  final MyServices myServices = Get.find<MyServices>();
  final Crud _crud = Get.find<Crud>();
  String url = AppLink.logout;
  bool isLoading = false;

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> logout() async {
    _setLoading(true);

    String? token = myServices.getAccessToken();
    if (token == null) {
      _setLoading(false);
      Get.snackbar('Error', 'User is not logged in.');
      return;
    }

    Map<String, dynamic> requestData = {};

    Map<String, String> headers = {
      ...AppLink.getHeader(),
      "Authorization": "Bearer $token",
    };

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
          Get.snackbar('Error', 'Log out failed');
        }
      },
      (responseBody) {
        try {
          if (responseBody == null) {
            throw Exception('Empty response from server');
          }
          print("Response Body: $responseBody");

          if (responseBody.containsKey('massage')) {
            final message = responseBody['massage'];
            myServices.saveAccessToken("");
            Get.offAll(() => const SignInScreen());
            myServices.sharedPreferences.clear();
            Get.snackbar('Success', message);
            print(responseBody);
            _setLoading(false);
            return responseBody;
          } else {
            throw Exception('Unexpected response structure');
          }
        } catch (e) {
          _setLoading(false);
          Get.snackbar('Error', 'Failed to process logout response: $e');
          print("Error: $e");
        }
      },
    );
  }
}
