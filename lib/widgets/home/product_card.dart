//
import 'package:flutter/material.dart';
import 'package:focalx_task6/view/cart/controller/cartController.dart';
import 'package:get/get.dart';
import '../../core/constant_data/colors.dart';

class ProductCard extends GetView<CartController> {
  final String productName;
  final String productImage;
  final int productPrice;
  final int productId;

  const ProductCard({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,

  });

  @override
  Widget build(BuildContext context) {
    Get.put(CartController(

    ));
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      productImage,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text(
                            "No Image Available",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.subtitle,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    const Text(
                      "BEST SELLER",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.hintTextColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Price
                    Text(
                      productPrice.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.titleColor),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Heart Icon (Top Left)
          Positioned(
            top: -5,
            left: -5,
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
          // Add to Cart Button (Bottom Right)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: GetBuilder<CartController>(builder: (controller)=>
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      controller.addToCart(productId);
                    },
                  ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
