import 'package:flutter/material.dart';
import '../core/constant_data/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? hintTextStyle;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.fillColor,
    this.hintTextStyle,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            const TextStyle(color: AppColors.hintTextColor, fontSize: 14),
        filled: true,
        fillColor: fillColor ?? AppColors.fieldsColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
