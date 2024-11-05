import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant_data/colors.dart';
import '../../../widgets/custom_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.fieldsColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {Get.back();},
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Search",
                    style: TextStyle(
                      color: AppColors.buttonTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Raleway",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "cancel",
                      style: TextStyle(
                        color: AppColors.dotColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              CustomTextFormField(
                obscureText: false,
                fillColor: AppColors.white,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.hintTextColor,
                ),
                hintText: "Search Your Shirt",
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1,
                      height: 30,
                      color: AppColors.hintTextColor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_voice_outlined,
                        color: AppColors.hintTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
