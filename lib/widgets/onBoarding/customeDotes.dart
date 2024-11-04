import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant_data/colors.dart';
import '../../data/dataSource/Static/static.dart';
import '../../view/onBoarding/controller/onBoardingController.dart';

class CustomeDotes extends StatelessWidget {
  const CustomeDotes({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          height: 6,
                          width: controller.currentPage == index ? 45 : 30,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: controller.currentPage == index
                                ? AppColors.white
                                : AppColors.dotColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))
              ],
            ));
  }
}
