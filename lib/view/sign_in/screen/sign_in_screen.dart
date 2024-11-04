import 'package:flutter/material.dart';
import 'package:focalx_task6/view/sign_in/controller/signInController.dart';
import 'package:get/get.dart';
import '../../../core/constant_data/colors.dart';
import '../../../core/constant_data/images.dart';
import '../../../widgets/auth/custom_button.dart';
import '../../../widgets/auth/custom_description_text.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/auth/custome_text_auth.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/auth/custom_title.dart';
import '../../register_account/screen/create_account_screen.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return Scaffold(
      body: Container(
        color: AppColors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 66),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackIcon(
                  color: AppColors.fieldsColor,
                  icon: Icon(Icons.arrow_back_ios),
                ),
                const Center(
                  child: CustomTitle(
                    title: "Hello Again!",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: CustomDescriptionText(
                    desc: "Fill your details or continue with \n social media",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<SignInController>(
                  builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomeTextAuth(
                        text: "Email Address",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        obscureText: false,
                        hintText: 'xyz@gmail.com',
                        controller: controller.emailController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomeTextAuth(
                        text: "Password",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        obscureText: controller.obscure,
                        controller: controller.passwordController,
                        hintText: '********',
                        suffixIcon: IconButton(
                            icon: controller.obscure
                                ? const Icon(
                                    Icons.visibility,
                                  )
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              controller.obscureFunc();
                            }),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: CustomDescriptionText(
                            desc: "Recovery Password",
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        onPressed: () {
                          controller.signIn();
                        },
                        buttonText: "Sign In",
                        buttonTextStyle:
                            const TextStyle(color: AppColors.white),
                        backgroundColor: AppColors.dotColor,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        onPressed: () {},
                        buttonText: "Sign In With Google",
                        buttonTextStyle:
                            const TextStyle(color: AppColors.buttonTextColor),
                        backgroundColor: AppColors.fieldsColor,
                        assetImage: AppImages.googleImage,
                      ),
                      const SizedBox(
                        height: 135,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New User?",
                            style: TextStyle(
                                color: AppColors.hintTextColor, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const CreateAccountScreen());
                            },
                            child: const Text(
                              " Create Account",
                              style: TextStyle(
                                  color: AppColors.black1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
