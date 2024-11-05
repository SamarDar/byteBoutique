import 'package:flutter/cupertino.dart';
import 'package:focalx_task6/view/sign_in/screen/sign_in_screen.dart';
import 'package:get/get.dart';
import '../../../data/dataSource/Static/static.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int currentPage = 0;

  next() async {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAll(const SignInScreen());
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
    update();
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
