import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/constant_data/colors.dart';
import '../../data/dataSource/Static/static.dart';
import '../../view/onBoarding/controller/onBoardingController.dart';

class CustomeSlider extends GetView<OnBoardingController> {
  const CustomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Stack(
        children: [
          ...onBoardingList[i].images?.map((image) {
                return Positioned(
                  top: image.top,
                  left: image.left,
                  bottom: image.bottom,
                  right: image.right,
                  child: SvgPicture.asset(
                    image.imagePath,
                  ),
                );
              }).toList() ??
              [],
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    onBoardingList[i].title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: controller.currentPage == 0
                          ? FontWeight.w900
                          : FontWeight.w700,
                      fontSize: 40,
                      color: AppColors.buttonColor,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
                SizedBox(
                    height: controller.currentPage == onBoardingList.length - 1
                        ? 50
                        : 100),
                Text(
                  onBoardingList[i].body ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.descColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
