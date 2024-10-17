import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/controller/password_registration_controller.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/model/registration_model.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../../core/common/app_preferences.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_diamentions.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/app_string.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/base_text_form_field.dart';
import '../../../../widgets/custom_animated_button.dart';
import '../../../../widgets/custom_toastification.dart';
import '../../../login_screen/model/login_model.dart';

class PasswordRegistrationScreen extends GetView<PasswordRegistrationController> {
  const PasswordRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.white, AppColors.gradientGrayBottomColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Great to welcome you onboard - but first, we need a few details.",
                          textAlign: TextAlign.left,
                          style: AppFonts.regular(25, AppColors.textBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Enter an email so that we can send you password reset link",
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                        child: BaseTextFormField(
                          headerText: "First Name",
                          controller: controller.firstNameController,
                          hintText: "Enter First Name",
                          keyboardType: TextInputType.emailAddress,
                          maxLine: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                        child: BaseTextFormField(
                          headerText: "Last Name",
                          controller: controller.lastNameController,
                          hintText: "Enter Last Name",
                          keyboardType: TextInputType.emailAddress,
                          maxLine: 1,
                        ),
                      ),
                      Obx(() {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                          child: BaseTextFormField(
                            headerText: "New Password",
                            controller: controller.passwordController,
                            hintText: "Enter New Password",
                            keyboardType: TextInputType.text,
                            suffixIcon: controller.isShowPassword.value ? ImagePath.passwordHide : ImagePath.passwordShow,
                            obscureText: controller.isShowPassword.value,
                            maxLine: 1,
                            onTapSuffixIcon: () {
                              controller.isShowPassword.toggle();
                            },
                          ),
                        );
                      }),
                      Obx(() {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                          child: BaseTextFormField(
                            headerText: "Confirm New Password",
                            controller: controller.confirmPasswordController,
                            hintText: "Enter Confirm New Password",
                            keyboardType: TextInputType.text,
                            suffixIcon: controller.isShowConfirmPassword.value ? ImagePath.passwordHide : ImagePath.passwordShow,
                            obscureText: controller.isShowConfirmPassword.value,
                            maxLine: 1,
                            onTapSuffixIcon: () {
                              controller.isShowConfirmPassword.toggle();
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () {
                          return Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    controller.isTermsCondition.toggle();
                                  },
                                  child: controller.isTermsCondition.isTrue
                                      ? SvgPicture.asset(ImagePath.radioSelect, width: 18, height: 18)
                                      : SvgPicture.asset(ImagePath.radioUnSelect, width: 18, height: 18)),
                              const SizedBox(width: Dimen.margin6),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "I agree to the ",
                                      style: AppFonts.regular(13, AppColors.textBlack),
                                    ),
                                    const TextSpan(text: " "),
                                    TextSpan(
                                      text: "Terms of service",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: const TextStyle(fontSize: 13, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                                    ),
                                    const TextSpan(text: " "),
                                    TextSpan(
                                      text: "and",
                                      style: AppFonts.regular(13, AppColors.textBlack),
                                    ),
                                    const TextSpan(text: " "),
                                    TextSpan(
                                      text: "Privacy Policy.",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Navigator.pushNamed(context, AppRoutes.);
                                        },
                                      style: const TextStyle(fontSize: 13, color: AppColors.textDarkGray, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () {
                          return Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    controller.isRememberMe.toggle();
                                    // context.read<LoginBloc>().add(ToggleRememberMe());
                                  },
                                  child: controller.isRememberMe.isTrue
                                      ? SvgPicture.asset(ImagePath.radioSelect, width: 18, height: 18)
                                      : SvgPicture.asset(ImagePath.radioUnSelect, width: 18, height: 18)),
                              const SizedBox(width: Dimen.margin6),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Please don’t send me any marketing material",
                                      style: AppFonts.regular(13, AppColors.textBlack),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
                Obx(() {
                  return CustomAnimatedButton(
                    text: "Register",
                    isLoading: controller.isLoading.value,
                    onPressed: () async {
                      if (controller.loginValidation()) {
                        RegistrationModel response = await controller.authRegistrationUser();
                        if (response.id != null) {
                          Get.toNamed(Routes.otpRegistration, parameters: {
                            'email': controller.email,
                            'password': controller.passwordController.text ?? "",
                            'userId': response.id.toString(),
                          });

                          // Future.delayed(Duration(milliseconds: 100), () async {
                          //   LoginModel loginResponse = await controller.authLoginUser(response.email ?? "", response.password ?? "");
                          //
                          //   if (loginResponse.user?.id != null) {
                          //     print("Login response is ${loginResponse.toJson()}");
                          //
                          //     await AppPreference.instance.setString(AppString.prefKeyUserLoginData, json.encode(loginResponse.toJson()));
                          //   }
                          //   // Do something
                          // });
                        }
                      }
                    },
                  );
                }),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 16),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account?",
                          style: AppFonts.regular(15, AppColors.textBlack),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(
                          text: "Login",
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(fontSize: 15, color: AppColors.backgroundYellow, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
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
