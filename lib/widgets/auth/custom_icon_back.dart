import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomBackIcon extends StatelessWidget {
  final Widget icon;
  final Color color;

  const CustomBackIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: icon,
          ),
        ),
      ),
    );
  }
}
