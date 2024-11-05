import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constant_data/app_text_styles.dart';
import '../../../core/constant_data/colors.dart';
import '../../../core/constant_data/images.dart';
import '../../../data/model/all_products_model.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../cart/controller/cartController.dart';

class DetailsScreen extends GetView<CartController> {
  final Datum product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: const CustomBackIcon(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: AppColors.white,
        ),
        title: Text(
          'T-shirt Shop',
          style: AppTextStyles.appBarText,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 3,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 21.0, top: 16.0),
                child: Text(
                  "${product.name}",
                  style: AppTextStyles.detailsTitle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 21.0),
                child: Text(
                  "${product.subCategory.category.name} T-shirt",
                  style: AppTextStyles.subtitle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 21.0, top: 8.0),
                child: Text(
                  "\$${product.price}",
                  style: AppTextStyles.price,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.network(
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
                '${product.image}',
                width: 289,
                height: 300,
              ),
            ),
            Center(child: SvgPicture.asset(AppImages.slider)),
            const SizedBox(
              height: 22.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0), // Adds spacing between containers
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              "No Image Available",
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.subtitle,
                              ),
                            ),
                          );
                        },
                        '${product.image}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Text(
                "Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ......",
                style: AppTextStyles.productDescription,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 21.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Read More",
                    style: AppTextStyles.seeAll,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 21.0, left: 21.0),
              child: Row(
                children: [
                  Container(
                      width: 52.0,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9).withOpacity(0.40),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.heart))),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.addToCart(product.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.cart,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "Add to Cart",
                            style: AppTextStyles.buttonText,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
