import 'package:flutter/material.dart';
import '../../core/constant_data/colors.dart';

class CustomTextProfile extends StatelessWidget {
  final String text;

  const CustomTextProfile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.subtitle,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Raleway",
      ),
    );
  }
}
