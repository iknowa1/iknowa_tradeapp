import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/common/common_service.dart';
import '../../../../utils/validation_string.dart';
import '../../../../widgets/custom_toastification.dart';

class EmailRegistrationController extends GetxController {
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  bool loginValidation() {
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
