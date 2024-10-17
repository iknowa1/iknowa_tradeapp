import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/core/common/app_preferences.dart';
import 'package:trade_app/screens/login_screen/model/login_model.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/validation_string.dart';
import '../../../../widgets/common_image_modal_view.dart';
import '../../../../widgets/custom_toastification.dart';
import '../model/profile_picture_upload_model.dart';
import '../model/save_profile_picture_model.dart';
import '../repository/add_profile_picture_respository.dart';

class AddProfilePictureController extends GetxController {
  final AddProfilePictureRespository _addProfilePictureRespository = AddProfilePictureRespository();
  RxString profileImagePath = RxString("");
  Rxn<File> profileImage = Rxn();
  String userId = "";
  String attachmentUrl = "";
  RxBool isLoading = RxBool(false);
  LoginModel loginData = LoginModel();

  @override
  void onInit() async {
    super.onInit();
    userId = Get.parameters['userId']!;
    print("profile picture userId is $userId");

    loginData = LoginModel.fromJson(jsonDecode(AppPreference.instance.getString(AppString.prefKeyUserLoginData)));
    AppPreference.instance.setString(loginData.idToken ?? "", AppString.prefKeyToken);
  }

  void selectProfilePopup(BuildContext context) {
    showImageModalSheet(
        context: context,
        onGalleryTap: () async {
          final image = await pickImage(ImageSource.gallery);

          if (image != null && context.mounted) {
            profileImage.value = File(image.path);
            profileImagePath.value = image.path;
            Navigator.pop(context);
          }
        },
        onCameraTap: () async {
          final image = await pickImage(ImageSource.camera);

          if (image != null && context.mounted) {
            profileImage.value = File(image.path);
            profileImagePath.value = image.path;
            Navigator.pop(context);
          }
        });
  }

  Future<XFile?> pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    return image;
  }

  bool validation() {
    if (profileImage.value == null) {
      CustomToastification().showToast(ValidationString.validationPleaseSelectProfilePicture, type: ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }

  Future<ProfilePictureUploadModel> uploadProfilePicture() async {
    isLoading.value = true;
    try {
      ProfilePictureUploadModel registrationModel = await _addProfilePictureRespository.uploadImage(profileFile: profileImage.value!, token: loginData.idToken ?? "");
      isLoading.value = false;
      print("response is ${registrationModel.toJson()} ");
      return registrationModel;
    } catch (error) {
      isLoading.value = false;
      // print("catch error is ${error}");
      CustomToastification().showToast("$error", type: ToastificationType.error);
      return ProfilePictureUploadModel.fromJson({});
    }
  }

  Future<SaveProfilePictureModel> saveProfilePicture() async {
    isLoading.value = true;
    try {
      SaveProfilePictureModel registrationModel = await _addProfilePictureRespository.saveProfilePicture(userId: userId, profileUrl: attachmentUrl);
      isLoading.value = false;
      print("response is ${registrationModel.toJson()} ");
      return registrationModel;
    } catch (error) {
      isLoading.value = false;
      CustomToastification().showToast("$error", type: ToastificationType.error);
      return SaveProfilePictureModel.fromJson({});
    }
  }
}
