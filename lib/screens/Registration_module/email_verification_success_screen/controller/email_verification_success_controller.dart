import 'package:get/get.dart';

class EmailVerificationSuccessController extends GetxController {
  dynamic argumentData = Get.arguments;
  String userId = "";
  bool isFromLogin = false;

  @override
  void onInit() async {
    super.onInit();

    userId = Get.parameters['userId']!;
    print("success user id  ${userId}");

    var fromLogin = Get.parameters['isFromLogin'];
    if (fromLogin == "true") {
      isFromLogin = true;
      print("is from login");
    } else {
      isFromLogin = false;
      print("is not from login");
    }
  }
}
