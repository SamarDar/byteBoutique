import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant_data/colors.dart';
import '../../view/onBoarding/controller/onBoardingController.dart';

class CustomeButtonOnBoarding extends StatelessWidget {
  const CustomeButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        builder: (controller) => MaterialButton(
              onPressed: () {
                controller.next();
              },
              color: AppColors.buttonColor,
              minWidth: 350,
              height: 60,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.buttonColor)),
              child: controller.currentPage == 0
                  ? const Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 20, color: AppColors.buttonTextColor),
                    )
                  : const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 20, color: AppColors.buttonTextColor),
                    ),
            ));
  }
}
