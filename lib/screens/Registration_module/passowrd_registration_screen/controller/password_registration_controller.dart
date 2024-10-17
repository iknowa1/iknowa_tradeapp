import 'package:aescryptojs/aescryptojs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/core/common/common_service.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/model/registration_model.dart';
import 'package:trade_app/screens/Registration_module/passowrd_registration_screen/repository/registration_repository.dart';

import '../../../../core/common/url_provider.dart';
import '../../../../utils/validation_string.dart';
import '../../../../widgets/custom_toastification.dart';
import '../../../login_screen/model/login_model.dart';
import '../../../login_screen/repository/login_repository.dart';

class PasswordRegistrationController extends GetxController {
  final RegistrationRepository _registrationRepository = RegistrationRepository();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isRememberMe = RxBool(false);
  RxBool isTermsCondition = RxBool(false);
  RxBool isShowPassword = RxBool(true);
  RxBool isShowConfirmPassword = RxBool(true);
  RxBool isLoading = RxBool(false);

  dynamic argumentData = Get.arguments;
  String email = "";

  @override
  void onInit() async {
    super.onInit();
    email = Get.parameters['email']!;
    print("email is $email");
  }

  Future<RegistrationModel> authRegistrationUser() async {
    isLoading.value = true;
    final encryptedPassword = encryptAESCryptoJS(passwordController.text.trim(), UrlProvider.encryptionKey);
    try {
      RegistrationModel registrationModel = await _registrationRepository.registerUser(
          firstName: firstNameController.text, lastName: lastNameController.text, email: email, password: encryptedPassword, tcOption: isTermsCondition.value, marketingOption: isRememberMe.value);
      isLoading.value = false;
      print("response is ${registrationModel.toJson()} ");
      return registrationModel;
    } catch (error) {
      isLoading.value = false;
      // print("catch error is ${error}");
      CustomToastification().showToast("$error", type: ToastificationType.error);
      return RegistrationModel.fromJson({});
    }
  }

  bool loginValidation() {
    if (firstNameController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationFirstNameEmpty, type: ToastificationType.error);
      return false;
    } else if (lastNameController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationLastNameEmpty, type: ToastificationType.error);
      return false;
    } else if (passwordController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationPasswordEmpty, type: ToastificationType.error);
      return false;
    } else if (!validatePassword(passwordController.text)) {
      CustomToastification().showToast(ValidationString.validationPassword, type: ToastificationType.error);
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationConfirmPasswordEmpty, type: ToastificationType.error);
      return false;
    } else if (!validatePassword(confirmPasswordController.text)) {
      CustomToastification().showToast(ValidationString.validationConfirmPassword, type: ToastificationType.error);
      return false;
    } else if (isTermsCondition.isFalse) {
      CustomToastification().showToast(ValidationString.validationTermsCondition, type: ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }
}
