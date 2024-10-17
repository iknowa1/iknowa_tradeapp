import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/core/common/app_preferences.dart';
import 'package:trade_app/screens/Registration_module/add_profile_picture_screen/controller/add_profile_picture_controller.dart';
import 'package:trade_app/screens/Registration_module/add_profile_picture_screen/model/save_profile_picture_model.dart';
import 'package:trade_app/screens/login_screen/view/login_screen.dart';
import '../../../../route/app_pages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/imagepath.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/custom_animated_button.dart';
import '../../../../widgets/custom_toastification.dart';
import '../model/profile_picture_upload_model.dart';

class AddProfilePictureScreen extends GetView<AddProfilePictureController> {
  const AddProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const CustomAppBar(),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: Obx(() {
                              return Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [AppColors.white, AppColors.gradientGrayBottomColor],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: controller.profileImage.value != null
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.selectProfilePopup(context);
                                        },
                                        child: Image.file(
                                          controller.profileImage.value!,
                                          fit: BoxFit.cover,
                                        ))
                                    : Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ImagePath.uploadProfile,
                                            height: 35,
                                            width: 35,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectProfilePopup(context);
                                            },
                                            child: const Text(
                                              "Upload Profile",
                                              style: TextStyle(
                                                color: AppColors.textBlue,
                                                fontFamily: "Mulish",
                                                fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        "Upload Your Profile Pic",
                        textAlign: TextAlign.left,
                        style: AppFonts.regular(30, AppColors.textBlack),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please select or capture an image to be uploaded",
                      style: AppFonts.regular(15, AppColors.textDarkGray),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
                Obx(() {
                  return CustomAnimatedButton(
                    isLoading: controller.isLoading.value,
                    text: "Go To dashboard",
                    onPressed: () async {
                      if (controller.validation()) {
                        ProfilePictureUploadModel response = await controller.uploadProfilePicture();
                        print("profile upload response ${response.toJson()}");
                        if (response.attachment!.isNotEmpty) {
                          controller.attachmentUrl = response.attachment ?? "";

                          SaveProfilePictureModel saveProfileResponse = await controller.saveProfilePicture();
                          if (saveProfileResponse.id != null) {
                            AppPreference.instance.clearPreference();
                            CustomToastification().showToast("Profile uploaded successfully", type: ToastificationType.success);
                            Get.to(LoginScreen());
                          }
                        }
                      }
                    },
                  );
                }),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 16),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "No Image",
                          style: AppFonts.regular(15, AppColors.textBlack),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(
                          text: "Skip",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(LoginScreen());
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
    );
  }
}
