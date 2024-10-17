import 'package:aescryptojs/aescryptojs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/core/common/common_service.dart';
import 'package:trade_app/core/common/url_provider.dart';
import 'package:trade_app/screens/Registration_module/otp_registration_screen/repository/otp_registration_repository.dart';
import 'package:trade_app/screens/login_screen/repository/login_repository.dart';
import 'package:trade_app/utils/validation_string.dart';
import 'package:trade_app/widgets/custom_toastification.dart';
import '../../../data/provider/api_provider.dart';
import '../../../route/app_pages.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  final EmailVerifyRepository _emailVerifyRepository = EmailVerifyRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isShowPassword = RxBool(true);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();

    // emailController.text = "kishan.suthar@esparkbizmail.com";
    // passwordController.text = "Kishansuthar123@";
  }

  Future<bool> sendEmailOTP({
    required String email,
  }) async {
    var response = await ApiProvider.instance.callStringPost("auth/verify/resend", params: {"email": email});
    print("internal response $response");
    return response;
  }

  Future<LoginModel> authLoginUser() async {
    isLoading.value = true;
    final encryptedPassword = encryptAESCryptoJS(passwordController.text.trim(), UrlProvider.encryptionKey);
    try {
      LoginModel loginModel = await _loginRepository.login(email: emailController.text.toLowerCase(), password: encryptedPassword);
      isLoading.value = false;
      print("response is ${loginModel.toJson()} ");
      return loginModel;
    } catch (error) {
      isLoading.value = false;
      print("login catch error is $error");

      if (error.toString().contains(" email address is not verified")) {
        print("Email is not verified");

        _emailVerifyRepository.sendEmailOTP(email: emailController.text);

        Get.toNamed(Routes.otpRegistration, parameters: {'email': emailController.text, 'password': passwordController.text ?? "", 'isFromLogin': "true"});
      }

      CustomToastification().showToast("$error", type: ToastificationType.error);
      return LoginModel.fromJson({});
    }
  }

  bool loginValidation() {
    if (emailController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationEmailEmpty, type: ToastificationType.error);
      return false;
    } else if (!validateEmail(emailController.text)) {
      CustomToastification().showToast(ValidationString.validationValidEmail, type: ToastificationType.error);
      return false;
    } else if (passwordController.text.isEmpty) {
      CustomToastification().showToast(ValidationString.validationPasswordEmpty, type: ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }
}
