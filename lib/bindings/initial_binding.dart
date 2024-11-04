import 'package:get/get.dart';
import '../core/classes/crud.dart';
import '../core/classes/network_manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(NetworkManager());
  }
}
