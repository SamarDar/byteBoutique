import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../core/constant_data/colors.dart';
import '../../view/cart/controller/cartController.dart';

class CustomSlidablecart extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final int initialQuantity;
  final int index;

  const CustomSlidablecart({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.initialQuantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Slidable(
      key: ValueKey(title),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,
        extentRatio: 0.22,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      cartController.onQuantityChanged(
                          initialQuantity + 1, index);
                    },
                  ),
                  Text(
                    '${cartController.cartItems[index]['quantity']}',
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.white),
                    onPressed: () {
                      if (cartController.cartItems[index]['quantity'] > 1) {
                        cartController.onQuantityChanged(
                            initialQuantity - 1, index);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dragDismissible: false,
        extentRatio: 0.18,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 104,
            decoration: BoxDecoration(
              color: const Color(0xffFF1900),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Get.defaultDialog(
                    title: "Delete Item",
                    content: const Text(
                        "Are you sure you want to delete this item?"),
                    onCancel: () => Get.back(),
                    onConfirm: () {
                      cartController.onDeleteQ(index);
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 87,
                  height: 85,
                  decoration: BoxDecoration(
                    color: AppColors.fieldsColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.network( errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        "No Image Available",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.subtitle,
                        ),
                      ),
                    );
                  },imageUrl, fit: BoxFit.cover),
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1A2530),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1A2530),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
