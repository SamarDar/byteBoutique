
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/custome_page_view_controller.dart';
import 'custom_bottom_navigator_bar.dart';

class CustomPageView extends GetView<CustomePageViewController> {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomePageViewController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF7F7F9),
      body: GetBuilder<CustomePageViewController>(
        builder: (controller) =>Column(
          children: [
            Expanded(
              child: PageView(
                physics:
                const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                onPageChanged: (val) {
                  controller.onPageChanged(val);
                },
                controller: controller.controller,
                children: controller.screens,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/812 * 106,
              width: MediaQuery.of(context).size.width/375 * 375,
              child: CustomBottomNavigatorBar(
                onTap: () {
                  controller.onTap();
                },
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                pageController: controller.controller,
              ),
            ),

          ],
        )
      ),
    );
  }
}