import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trade_app/screens/reset_password_screen/reset_password_controller/reset_password_controller.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_diamentions.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/imagepath.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text_form_field.dart';
import '../../../widgets/custom_animated_button.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.white, AppColors.gradientGrayBottomColor], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.1, 0.6]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Container(
                            margin: const EdgeInsets.only(left: 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: SvgPicture.asset(
                                ImagePath.back,
                                height: 44,
                                width: 44,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "Reset Password",
                            textAlign: TextAlign.left,
                            style: AppFonts.regular(30, AppColors.textBlack),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "If the email address has an account, an email will be sent with a link to reset your password",
                          style: AppFonts.regular(15, AppColors.textDarkGray),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                          child: BaseTextFormField(
                            headerText: "Password",
                            controller: controller.passwordController,
                            hintText: "Enter Password",
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            maxLine: 1,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.validationInfo, width: 18, height: 18),
                            const SizedBox(width: Dimen.margin6),
                            Text(
                              "Must be at least 8 characters long",
                              style: AppFonts.regular(13, AppColors.textBlack),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.validationInfo, width: 18, height: 18),
                            const SizedBox(width: Dimen.margin6),
                            Text(
                              "Must contain an uppercase and lowercase (A, a)",
                              style: AppFonts.regular(13, AppColors.textBlack),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.validationInfo, width: 18, height: 18),
                            const SizedBox(width: Dimen.margin6),
                            Text(
                              "Must contain an number",
                              style: AppFonts.regular(13, AppColors.textBlack),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.validationInfo, width: 18, height: 18),
                            const SizedBox(width: Dimen.margin6),
                            Text(
                              "Must contain a special character (!, %, @, #)",
                              style: AppFonts.regular(13, AppColors.textBlack),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: Dimen.margin10),
                          child: BaseTextFormField(
                            headerText: "Confirm New Password",
                            controller: controller.confirmPasswordController,
                            hintText: "Enter Confirm New Password",
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            maxLine: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomAnimatedButton(
                          text: "Submit",
                          onPressed: () {
                            Get.toNamed(Routes.mobileOTPVerification);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
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
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: const TextStyle(fontSize: 15, color: AppColors.backgroundYellow, fontFamily: "Mulish", fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
