import 'dart:ffi';

import 'package:aescryptojs/aescryptojs.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/screens/Registration_module/otp_registration_screen/model/email_verificartion_model.dart';
import 'package:trade_app/screens/Registration_module/otp_registration_screen/repository/otp_registration_repository.dart';

import '../../../../core/common/url_provider.dart';
import '../../../../utils/validation_string.dart';
import '../../../../widgets/OTPView/otp_field.dart';
import '../../../../widgets/custom_toastification.dart';
import '../../../login_screen/model/login_model.dart';
import '../../../login_screen/repository/login_repository.dart';

class OtpRegistrationController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  final EmailVerifyRepository _emailVerifyRepository = EmailVerifyRepository();
  final OtpFieldController otpFieldController = OtpFieldController();
  RxString otpValue = RxString("");
  dynamic argumentData = Get.arguments;
  String email = "";
  String userId = "";
  String userPassword = "";
  RxBool isLoading = RxBool(false);
  bool isFromLogin = false;

  @override
  void onInit() async {
    super.onInit();
    email = Get.parameters['email']!;
    userPassword = Get.parameters['password']!;

    var userid = Get.parameters['userId'];
    if (userid != null) {
      userId = Get.parameters['userId']!;
      print("is userID get");
    } else {
      print("userID not getting");
    }

    var fromLogin = Get.parameters['isFromLogin'];
    if (fromLogin != null) {
      isFromLogin = true;
      print("is from login");
    } else {
      print("is not from login");
    }

    print("otp email is $email");
    print("user id $userId");
  }

  Future<LoginModel> authLoginUser(String email) async {
    print("password is :- $userPassword");
    final encryptedPassword = encryptAESCryptoJS(userPassword.trim(), UrlProvider.encryptionKey);

    try {
      LoginModel loginModel = await _loginRepository.login(email: email.toLowerCase(), password: encryptedPassword);

      print("LOGIN response is ${loginModel.toJson()} ");
      return loginModel;
    } catch (error) {
      print("login catch called error is $error");
      return LoginModel.fromJson({});
    }
  }

  Future<bool> resendEmailOTP() async {
    try {
      bool registrationModel = await _emailVerifyRepository.sendEmailOTP(email: email);
      isLoading.value = false;
      print("authEmailVerify is ${registrationModel} ");
      return registrationModel;
    } catch (error) {
      print("catch error is ${error}");
      CustomToastification().showToast("$error", type: ToastificationType.error);
      return false;
    }
  }

  Future<EmailVerifyModel> authEmailVerify() async {
    isLoading.value = true;
    try {
      EmailVerifyModel registrationModel = await _emailVerifyRepository.emailVerify(email: email, otp: otpValue.value);
      isLoading.value = false;
      print("response is ${registrationModel.toJson()} ");
      return registrationModel;
    } catch (error) {
      isLoading.value = false;
      // print("catch error is ${error}");
      CustomToastification().showToast("$error", type: ToastificationType.error);
      return EmailVerifyModel.fromJson({});
    }
  }

  bool validation() {
    if (otpValue.value.isEmpty) {
      CustomToastification().showToast(ValidationString.validationEnterOTP, type: ToastificationType.error);
      return false;
    } else if (otpValue.value.length != 4) {
      CustomToastification().showToast(ValidationString.validationEnter4digitOTP, type: ToastificationType.error);
      return false;
    } else {
      return true;
    }
  }
}
