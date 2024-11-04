import 'package:flutter/material.dart';
import '../../core/constant_data/colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.buttonTextColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
