import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/classes/status_requests.dart';
import '../../../core/constant_data/app_text_styles.dart';
import '../../../core/constant_data/colors.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/cart/check_out_box.dart';
import '../../../widgets/cart/custom_slidablecart.dart';
import '../controller/cartController.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: const CustomBackIcon(
          color: AppColors.white,
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          "My Cart",
          style: AppTextStyles.appBarText,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          switch (controller.statusRequest) {
            case StatusRequest.loading:
              return const Center(child: CircularProgressIndicator());
            case StatusRequest.success:
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              "${controller.cartItems.length} Item${controller.cartItems.length > 1 ? 's' : ''}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // List of cart items
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 14,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(20.0),
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              return CustomSlidablecart(
                                imageUrl: controller.cartItems[index]['peoduct']
                                    ['image'],
                                title: controller.cartItems[index]['peoduct']
                                    ['name'],
                                price:
                                    '\$${controller.cartItems[index]['peoduct']['price']}',
                                initialQuantity: controller.cartItems[index]
                                    ['quantity'],
                                index: index,

                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CheckOutBox(),
                ],
              );
            default:
              return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
