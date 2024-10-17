import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/forgot_password_screen/repository/forgot_password_repository.dart';
import '../../../core/common/common_service.dart';
import '../../../utils/validation_string.dart';
import '../../../widgets/custom_toastification.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordRepository _forgotPasswordRepository = ForgotPasswordRepository();
  TextEditingController emailController = TextEditingController();
  RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();
  }

  Future<bool> authEmailVerify() async {
    isLoading.value = true;
    try {
      bool registrationModel = await _forgotPasswordRepository.sendEmailOTP(email: emailController.text);
      isLoading.value = false;
      print("authEmailVerify is ${registrationModel} ");
      return registrationModel;
    } catch (error) {
      isLoading.value = false;
      print("catch error is ${error}");
      CustomToastification().showToast("$error", type: ToastificationType.error);
      return false;
    }
  }

  bool validation() {
    if (emailController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationEmailEmpty, type: ToastificationType.error);
      return false;
    } else if (!validateEmail(emailController.text)) {
      CustomToastification().showToast(ValidationString.validationValidEmail, type: ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }
}
