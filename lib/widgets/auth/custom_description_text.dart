import 'package:flutter/material.dart';
import '../../core/constant_data/colors.dart';



class CustomDescriptionText extends StatelessWidget {
  final String desc;
  const CustomDescriptionText({
    super.key,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      desc,
      style: const TextStyle(
        color: AppColors.descColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
