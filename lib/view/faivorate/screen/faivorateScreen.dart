import 'package:flutter/material.dart';

import '../../../core/constant_data/colors.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/auth/custom_title.dart';


class FaivorateScreen extends StatelessWidget {
  const FaivorateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.fieldsColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackIcon(
                      color: AppColors.fieldsColor,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    CustomTitle(title: "Favourite"),
                    CustomBackIcon(
                      color: AppColors.fieldsColor,
                      icon: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                SizedBox(
                  height: 800,
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: 4,
                    itemBuilder: (context, index) {
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
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(10)),
                                      child: Image.network(
                                        "https://th.bing.com/th/id/OIP.5JHHXptTFQuC3EnrQPKjjwHaHh?rs=1&pid=ImgDetMain",
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 30),
                                              child: Text(
                                                "No Image Available",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: AppColors.subtitle,
                                                ),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      // Product Name
                                      const Text(
                                        "BEST SELLER",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: AppColors.primaryColor),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Programmer T-shirt",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.hintTextColor,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      // Price
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "\$58.7",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: AppColors.titleColor),
                                          ),
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    color: Colors.green,
                                                  ),
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    color: Colors.blue,
                                                  ),
                                                  width: 15,
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Heart Icon (Top Left)
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: AppColors.fieldsColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 6),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite_outlined,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
