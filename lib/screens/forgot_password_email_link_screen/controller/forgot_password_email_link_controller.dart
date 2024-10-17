import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import '../../../widgets/custom_toastification.dart';
import '../../forgot_password_screen/repository/forgot_password_repository.dart';

class ForgotPasswordEmailLinkController extends GetxController {
  final ForgotPasswordRepository _forgotPasswordRepository = ForgotPasswordRepository();
  dynamic argumentData = Get.arguments;
  RxString email = RxString("");
  RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();

    email.value = Get.parameters['email']!;
    print("email is $email");
  }

  Future<bool> authEmailVerify() async {
    isLoading.value = true;
    try {
      bool registrationModel = await _forgotPasswordRepository.sendEmailOTP(email: email.value);
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
}
