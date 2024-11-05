import 'package:flutter/material.dart';

import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/notification/custom_notification_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F9),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackIcon(
                      color: Colors.white,
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomBackIcon(
                      color: Colors.white,
                      icon: Icon(
                        Icons.delete_forever_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Recent",
                  style: TextStyle(
                    color: Color(0xFF2B2B2B),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomNotificationContainer(
                  containerColor: Colors.white,
                  backgroundImageColor: Color(0xFFF7F7F9),
                  time: "7 min ago",
                  imagePath: "assets/images/cloth.png",
                  title: "Thanks you for purchasing",
                  desc: "Your order will be shipped in 2-4 days",
                ),
                const SizedBox(height: 8,),
                CustomNotificationContainer(
                  containerColor: const Color(0xFFF7F7F9),
                  backgroundImageColor: Colors.white,
                  time: "40 min ago",
                  imagePath: "assets/images/cloth.png",
                  title: "We Have New Products With Offers",
                  onePrice: "\$364.95",
                  twoPrice: "\$260.00",
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Yesterday",
                  style: TextStyle(
                    color: Color(0xFF2B2B2B),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8,),
                CustomNotificationContainer(
                  containerColor: Colors.white,
                  backgroundImageColor: const Color(0xFFF7F7F9),
                  time: "40 min ago",
                  imagePath: "assets/images/cloth.png",
                  title: "We Have New Products With Offers",
                  onePrice: "\$364.95",
                  twoPrice: "\$260.00",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
