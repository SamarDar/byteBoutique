import 'package:flutter/material.dart';

import '../../core/constant_data/colors.dart';

class SideMenuRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final IconData? suffixIcon;

  const SideMenuRow({
    super.key,
    required this.icon,
    required this.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 22,
            ),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontFamily: "Raleway",
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            suffixIcon,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
