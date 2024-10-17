import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/forgot_password_screen/controller/forgot_password_controller.dart';
import '../../../route/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_diamentions.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_string.dart';
import '../../../utils/validation_string.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text_form_field.dart';
import '../../../widgets/custom_animated_button.dart';
import '../../../widgets/custom_toastification.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: CustomAppBar(),
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
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        AppString.forgotPassword,
                        textAlign: TextAlign.left,
                        style: AppFonts.regular(30, AppColors.textBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppString.enterEmailThatWeCanSendYouPasswordResetLink,
                      style: AppFonts.regular(15, AppColors.textDarkGray),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: Dimen.margin24),
                      child: BaseTextFormField(
                        headerText: AppString.emailAddress,
                        controller: controller.emailController,
                        hintText: AppString.enterEmailAddress,
                        keyboardType: TextInputType.emailAddress,
                        maxLine: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return CustomAnimatedButton(
                        text: AppString.sendEmail,
                        isLoading: controller.isLoading.value,
                        onPressed: () async {
                          if (controller.validation()) {
                            dynamic response = await controller.authEmailVerify();
                            if (response != null) {
                              CustomToastification().showToast(ValidationString.validationMailSuccessfully, type: ToastificationType.success);
                              Get.toNamed(Routes.forgotPasswordEmailLink, parameters: {'email': controller.emailController.text});
                            }
                          }
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
