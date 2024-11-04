import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle firstTitle = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
    color: AppColors.buttonColor,
  );
  static TextStyle title = const TextStyle(
    fontSize: 34.0,
    fontWeight: FontWeight.w700,
    color: AppColors.buttonColor,
  );
  static TextStyle description = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: AppColors.descriptionColor,
  );
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
  static TextStyle signTitle = const TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );
  static TextStyle subtitle = const TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitle,
  );
  static TextStyle label = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.titleColor,
  );
  static TextStyle hintText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.hintColor);
  static TextStyle textSpanStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardTitle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: AppColors.titleColor,
  );
  static TextStyle seeAll = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: AppColors.primaryColor,
  );
  static TextStyle detailsTitle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 26.0,
    color: AppColors.titleColor,
  );
  static TextStyle detailsSubtitle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: AppColors.subtitle,
  );
  static TextStyle productDescription = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    color: AppColors.subtitle,
  );
  static TextStyle price = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    color: AppColors.titleColor,
  );
  static TextStyle buttonText = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: AppColors.white,
  );
  static TextStyle appBarText = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );
  static TextStyle profileText = const TextStyle(
    fontSize: 16.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.titleColor,
  );
  static TextStyle password = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: const Color(0xff6A6A6A).withOpacity(0.60),
  );
  static TextStyle profileLabel = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.subtitle,
  );
  static TextStyle sideMenuText = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}
