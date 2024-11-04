import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../constant_data/colors.dart';

class NetworkManager extends GetxController {
  var isConnected = true.obs;
  late Connectivity _connectivity;

  @override
  void onInit() {
    super.onInit();
    _connectivity = Connectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    checkConnection();
  }

  Future<void> checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      isConnected(false);
      Get.snackbar("Network Status", "You are offline",
          snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.descColor);
    } else {
      isConnected(true);
      Get.snackbar("Network Status", "You are connected",
          snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.descColor);
    }
  }
}
