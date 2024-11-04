import 'package:flutter/material.dart';
import '../../core/constant_data/colors.dart';

class CustomeTextAuth extends StatelessWidget {
  final String text;

  const CustomeTextAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.buttonTextColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
