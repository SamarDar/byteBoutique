import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/classes/validator.dart';
import '../../../core/constant_data/colors.dart';
import '../../../core/constant_data/images.dart';
import '../../../widgets/auth/custom_button.dart';
import '../../../widgets/auth/custom_description_text.dart';
import '../../../widgets/auth/custom_icon_back.dart';
import '../../../widgets/auth/custome_text_auth.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/auth/custom_title.dart';
import '../../sign_in/screen/sign_in_screen.dart';
import '../controller/create_account_controller.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 66),
            child: GetBuilder(
              init: CreateAccountController(),
              builder: (createAccountController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomBackIcon(
                      color: AppColors.fieldsColor,
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    const Center(
                      child: CustomTitle(
                        title: "Register Account",
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Center(
                      child: CustomDescriptionText(
                        desc:
                            "Fill your details or continue with \n social media",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: createAccountController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomeTextAuth(
                            text: "Your Name",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            obscureText: false,
                            hintText: 'xxxxxxxx',
                            validator: nameValidator,
                            controller:
                                createAccountController.fullNameController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const CustomeTextAuth(
                            text: "Email Address",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            obscureText: false,
                            hintText: 'xyz@gmail.com',
                            validator: emailValidator,
                            controller: createAccountController.emailController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const CustomeTextAuth(
                            text: "Password",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            obscureText: createAccountController.obscure,
                            validator: passwordValidator,
                            hintText: '********',
                            suffixIcon: IconButton(
                                icon: createAccountController.obscure
                                    ? const Icon(
                                        Icons.visibility,
                                      )
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  createAccountController.obscureFunc();
                                }),
                            controller:
                                createAccountController.passwordController,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            onPressed: () {
                              createAccountController.register();
                            },
                            buttonText: "Sign Up",
                            buttonTextStyle:
                                const TextStyle(color: AppColors.white),
                            backgroundColor: AppColors.dotColor,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                            onPressed: () {},
                            buttonText: "Sign Up With Google",
                            buttonTextStyle: const TextStyle(
                                color: AppColors.buttonTextColor),
                            backgroundColor: AppColors.fieldsColor,
                            assetImage: AppImages.googleImage,
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have account?",
                                style: TextStyle(
                                    color: AppColors.hintTextColor,
                                    fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const SignInScreen());
                                },
                                child: const Text(
                                  " Log In",
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
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
