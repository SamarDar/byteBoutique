import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant_data/colors.dart';
import '../../../core/constant_data/images.dart';
import '../../../widgets/drawer/side_menu_row.dart';
import '../controller/drawerController.dart';

class DrawerScreen extends GetView<Drawercontroller> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Drawercontroller());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.onBoardingColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppImages.profileImage),
                radius: 48,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Programmer X",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway"),
              ),
              const SizedBox(
                height: 55,
              ),
              const SideMenuRow(
                icon: Icons.person_outline_outlined,
                text: "Profile",
                suffixIcon: Icons.arrow_forward_ios,
              ),
              const SizedBox(
                height: 10,
              ),
              const SideMenuRow(
                icon: Icons.shopping_bag_outlined,
                text: "My Cart",
                suffixIcon: Icons.arrow_forward_ios,
              ),
              const SizedBox(
                height: 10,
              ),
              const SideMenuRow(
                icon: Icons.favorite_border,
                text: "Favourite",
                suffixIcon: Icons.arrow_forward_ios,
              ),
              const SizedBox(
                height: 10,
              ),
              const SideMenuRow(
                icon: Icons.fire_truck,
                text: "Orders",
                suffixIcon: Icons.arrow_forward_ios,
              ),
              const SizedBox(
                height: 10,
              ),
              const SideMenuRow(
                icon: Icons.notifications_active_outlined,
                text: "Notifications",
                suffixIcon: Icons.arrow_forward_ios,
              ),
              const SizedBox(
                height: 10,
              ),
              const SideMenuRow(
                icon: Icons.settings,
                text: "Settings",
                suffixIcon: Icons.arrow_forward_ios,
              ),
              const SizedBox(
                height: 38,
              ),
              const Divider(
                height: 3,
                color: AppColors.white,
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<Drawercontroller>(
                builder: (controller) => InkWell(
                  onTap: () {
                    controller.logout();
                  },
                  child: const SideMenuRow(
                    icon: Icons.logout,
                    text: "Sign Out",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
