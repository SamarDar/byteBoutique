import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focalx_task6/core/constant_data/colors.dart';
import 'package:get/get.dart';
import '../../../core/constant_data/images.dart';
import '../../../widgets/onBoarding/customSlider.dart';
import '../../../widgets/onBoarding/customeButtonOnBoarding.dart';
import '../../../widgets/onBoarding/customeDotes.dart';
import '../controller/onBoardingController.dart';

class OnBoardig extends GetView<OnBoardingController> {
  const OnBoardig({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.onBoardingColor,
            child: GetBuilder<OnBoardingController>(
              builder: (controller) => Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: CustomeSlider(),
                  ),
                  controller.currentPage == 0
                      ? Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 60,
                                left: 29,
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: SvgPicture.asset(
                                    AppImages.shapeThreeImage,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 50,
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: SvgPicture.asset(
                                    AppImages.shapeFourImage,
                                  ),
                                ),
                              ),
                              const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomeDotes(),
                                    SizedBox(height: 150),
                                    CustomeButtonOnBoarding(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomeDotes(),
                              SizedBox(height: 150),
                              CustomeButtonOnBoarding()
                            ],
                          )),
                ],
              ),
            )),
      ),
    );
  }
}
