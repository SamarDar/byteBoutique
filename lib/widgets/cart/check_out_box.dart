import 'package:flutter/material.dart';
import '../../core/constant_data/colors.dart';
import 'package:get/get.dart';
import '../../view/cart/controller/cartController.dart';
import 'customeRowCheckBox.dart';

class CheckOutBox extends GetView<CartController> {
  const CheckOutBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeRowCheckBox(
                  color1: const Color(0xff707B81),
                  color2: const Color(0xff1A2530),
                  text1: "Subtotal",
                  text2: "\$${controller.subTotal.toStringAsFixed(2)}",
                ),
                const SizedBox(
                  height: 8.0,
                ),
                CustomeRowCheckBox(
                  color1: const Color(0xff707B81),
                  color2: const Color(0xff1A2530),
                  text1: "Delivery",
                  text2: "\$${controller.deliveryFee.toStringAsFixed(2)}",
                ),
                const Text(
                  "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff707B81)),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomeRowCheckBox(
                  color1: const Color(0xff2B2B2B),
                  color2: const Color(0xff34C759),
                  text1: "Total Cost",
                  text2: "\$${controller.totalCost.toStringAsFixed(2)}",
                ),
                const SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
