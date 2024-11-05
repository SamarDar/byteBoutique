import 'package:flutter/material.dart';
import '../../../core/constant_data/colors.dart';
import '../../../core/constant_data/images.dart';
import '../../../widgets/auth/custom_button.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/profile/custom_text_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackIcon(
                      color: AppColors.fieldsColor,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: AppColors.buttonTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway",
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppImages.profileImage),
                            backgroundColor: Colors.red,
                            radius: 40,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.dotColor,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const CustomTextProfile(
                  text: "Your Name",
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  obscureText: false,
                  hintText: "Programmer X",
                  hintTextStyle: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                  fillColor: AppColors.fieldsColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextProfile(
                  text: "Email Address",
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  obscureText: false,
                  hintText: "Programmerx@gmail.com",
                  hintTextStyle: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                  fillColor: AppColors.fieldsColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextProfile(
                  text: "Password",
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomTextFormField(
                  obscureText: false,
                  hintText: "********",
                  hintTextStyle: TextStyle(
                    color: AppColors.hintTextColor,
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                  fillColor: AppColors.fieldsColor,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Recovery Password",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.subtitle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {},
                  buttonText: "Save Now",
                  buttonTextStyle: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                  backgroundColor: AppColors.dotColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
