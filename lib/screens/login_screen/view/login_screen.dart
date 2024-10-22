import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/login_screen/model/selected_account_model.dart';
import 'package:trade_app/utils/imagepath.dart';
import '../../../core/common/app_preferences.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_diamentions.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_string.dart';
import '../../../widgets/base_text_form_field.dart';
import '../../../widgets/custom_animated_button.dart';
import '../../../widgets/custom_toastification.dart';
import '../controller/login_controller.dart';
import '../model/login_model.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.maxFinite,
          // color: Colors.red,
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
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          "Welcome to iknowa!",
                          textAlign: TextAlign.left,
                          style: AppFonts.regular(30, AppColors.textBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                        style: AppFonts.regular(15, AppColors.textDarkGray),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: Dimen.margin24),
                        child: BaseTextFormField(
                          headerText: "Email address",
                          controller: controller.emailController,
                          hintText: "Enter Email Address",
                          keyboardType: TextInputType.emailAddress,
                          maxLine: 1,
                        ),
                      ),
                      Obx(() {
                        return BaseTextFormField(
                          headerText: "Password",
                          controller: controller.passwordController,
                          hintText: "Enter Password",
                          suffixIcon: controller.isShowPassword.value ? ImagePath.passwordHide : ImagePath.passwordShow,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: controller.isShowPassword.value,
                          maxLine: 1,
                          onTapSuffixIcon: () {
                            controller.isShowPassword.toggle();
                          },
                        );
                      }),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(top: 16),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Forgot Password?",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.forgotpassword);
                                    // Navigator.pushNamed(context, AppRoutes.);
                                  },
                                style: const TextStyle(
                                  color: AppColors.textBlue,
                                  fontFamily: "Mulish",
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(() {
                        return CustomAnimatedButton(
                          isLoading: controller.isLoading.value,
                          text: "Continue",
                          onPressed: () async {
                            if (controller.loginValidation()) {
                              LoginModel response = await controller.authLoginUser();

                              if (response.user?.id != null) {
                                if (response.user?.role?.id == 2) {
                                  SelectedAccountModel selectAccount =
                                      await controller.selectAccount(controller.emailController.text, response.user!.role!.id.toString(), response.user!.id.toString());
                                  print("SelectedAccountModel response ${selectAccount}");

                                  if (response.user!.verifiedEmail == false) {
                                  } else {
                                    Get.toNamed(Routes.setbiometricPascode);
                                  }
                                } else {
                                  await AppPreference.instance.setString(AppString.prefKeyUserLoginData, json.encode(response.toJson()));
                                  AppPreference.instance.setString(response.idToken ?? "", AppString.prefKeyToken);
                                  CustomToastification().showToast("Login success", type: ToastificationType.success);

                                  if (response.user!.verifiedEmail == false) {
                                  } else {
                                    Get.toNamed(Routes.setbiometricPascode);
                                  }
                                }
                              }
                            }
                            // Get.toNamed(Routes.forgotpassword);
                          },
                        );
                      }),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Don’t have an account?",
                                style: AppFonts.regular(15, AppColors.textBlack),
                              ),
                              const TextSpan(text: " "),
                              TextSpan(
                                text: "Register",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.emailRegistration);
                                    // Navigator.pushNamed(context, AppRoutes.);
                                  },
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
          ),
        ));
  }
}
