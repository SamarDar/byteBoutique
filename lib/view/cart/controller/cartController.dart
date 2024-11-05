import 'package:get/get.dart';
import 'package:focalx_task6/core/classes/status_requests.dart';
import '../../../core/classes/crud.dart';
import '../../../core/constant_data/link.dart';
import '../../../core/services/myServices.dart';

class CartController extends GetxController {


  final Crud _crud = Crud();
  List<dynamic> cartItems = [];
  StatusRequest _statusRequest = StatusRequest.none;
  final MyServices myServices = Get.find<MyServices>();
  StatusRequest get statusRequest => _statusRequest;


  double subTotal = 0;
  double deliveryFee = 60.20;
  double totalCost = 0;




  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  void getCartItems() async {
    _statusRequest = StatusRequest.loading;
    update();
    final result = await _crud.getData(
      AppLink.allOrders,
      AppLink.getHeaderWithToken(myServices.getAccessToken()),
    );
    result.fold(
      (left) {
        _statusRequest = left;
        update();
      },
      (right) {
        cartItems = right['data'];
        _statusRequest = StatusRequest.success;
        calculateTotals();
        update();
      },
    );
  }

  void addToCart(int id) async {
    final headers = AppLink.getHeaderWithToken(myServices.getAccessToken());
    final data = {
      'product_id': id,
      'quantity': 1,
    };
    final result = await Crud().postDate(AppLink.allOrders, data, headers);
    result.fold(
      (left) {
        print('Error: $left');
      },
      (right) {
        cartItems.add(right['data']);
        calculateTotals();
        Get.snackbar("Success", "Your product has been successfully added to your shopping cart.");
        update();
      },
    );
  }

  void onQuantityChanged(int quantity, int index) async {
    final updatedItem = {
      'product_id': cartItems[index]['peoduct']['id'],
      'quantity': quantity,
    };
    final headers = AppLink.getHeaderWithToken(myServices.getAccessToken());
    final result = await _crud.putData(
      '${AppLink.allOrders}/${cartItems[index]["id"]}',
      updatedItem,
      headers,
    );
    result.fold(
      (left) {
        print('Error updating quantity: $left');
      },
      (right) {
        cartItems[index]['quantity'] = quantity;
        calculateTotals();
        Get.snackbar("Success", "Your product has been successfully updated in your shopping cart.");
        update();
      },
    );
  }

  void onDeleteQ(int index) async {
    final headers = AppLink.getHeaderWithToken(myServices.getAccessToken());
    final result = await _crud.deleteData(
      '${AppLink.allOrders}/${cartItems[index]["id"]}',
      headers,
    );
    result.fold(
      (left) {
        print('Error deleting item: $left');
      },
      (right) {
        cartItems.removeAt(index);
        calculateTotals();
        Get.snackbar("Success", "Your product has been successfully removed from your shopping cart..");
        update();
      },
    );
  }

  void calculateTotals() {
    subTotal = 0;
    for (var item in cartItems) {
      subTotal += item['peoduct']['price'] * item['quantity'];
    }
    totalCost = subTotal + deliveryFee;
  }
}
