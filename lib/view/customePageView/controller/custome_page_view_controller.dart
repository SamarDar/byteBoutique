import 'package:flutter/material.dart';
import 'package:focalx_task6/view/cart/screen/cartScreen.dart';
import 'package:focalx_task6/view/home/screen/homescreen.dart';
import 'package:get/get.dart';
import '../../drawer/screen/drawer_screen.dart';
import '../../faivorate/screen/faivorateScreen.dart';
import '../../notifications/screen/notificationScreen.dart';
import '../../profile/screen/profileScreen.dart';

class CustomePageViewController extends GetxController {
  PageController controller = PageController();
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const FaivorateScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  onTap() {
    Get.to(const CartScreen());
    update();
  }

  onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  onTap2(int index) {
    currentIndex = index;
    controller.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    update(); // Update the GetX state
  }
}
