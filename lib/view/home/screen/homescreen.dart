import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focalx_task6/view/notifications/controller/notificationControllers.dart';
import 'package:get/get.dart';
import '../../../core/constant_data/colors.dart';
import '../../../core/constant_data/images.dart';
import '../../../data/model/all_products_model.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/auth/custom_title.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/home/product_card.dart';
import '../../details/screen/details.dart';
import '../../drawer/screen/drawer_screen.dart';
import '../../search/screen/search_screen.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return GetBuilder<NotificationsController>(builder: (controller)=>
        Scaffold(
          backgroundColor: AppColors.fieldsColor,
          appBar: AppBar(
            backgroundColor: AppColors.fieldsColor,
            centerTitle: true,
            title: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image(
                    image: AssetImage(AppImages.exploreImage),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 5),
                  child: CustomTitle(title: "Explore"),
                ),
              ],
            ),
            actions: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CustomBackIcon(
                      color: AppColors.fieldsColor,
                      icon: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 23,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          drawer: const Drawer(
            child: DrawerScreen(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder(
                init: HomeController(),
                builder: (homeController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 19,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              obscureText: false,
                              hintText: "Looking for",
                              controller: homeController.searchController,
                              fillColor: AppColors.white,
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    Get.to(const SearchScreen());
                                  },
                                  icon: Icon(Icons.search)),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          const CustomBackIcon(
                            color: AppColors.fieldsColor,
                            icon: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.list_outlined,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Select Category",
                        style: TextStyle(
                          color: AppColors.buttonTextColor,
                          fontFamily: "Raleway",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    homeController.categories[index].name,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular T-Shirt",
                            style: TextStyle(
                              color: AppColors.buttonTextColor,
                              fontFamily: "Raleway",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                color: AppColors.dotColor,
                                fontFamily: "Raleway",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 250,
                        child: GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: homeController.products.length,
                          itemBuilder: (context, index) {
                            Datum product = homeController.products[index];
                            return InkWell(
                              onTap: () {
                                Get.to(DetailsScreen(
                                  product: product,
                                ));
                              },
                              child: ProductCard(
                                productId: product.id,
                                productName: product.name,
                                productImage: product.image,
                                productPrice: product.price,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "New Arrivals",
                            style: TextStyle(
                              color: AppColors.buttonTextColor,
                              fontFamily: "Raleway",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                color: AppColors.dotColor,
                                fontFamily: "Raleway",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21.0),
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              AppImages.newArrivalsImage,
                              width: 400,
                            ),
                            Positioned(
                                right: 4,
                                bottom: 3,
                                child: Image.asset(AppImages.shirtImage))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        )
    );
  }
}
