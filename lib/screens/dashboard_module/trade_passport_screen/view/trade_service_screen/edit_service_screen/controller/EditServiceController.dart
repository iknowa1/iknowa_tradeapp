import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditServiceController extends GetxController {
  TextEditingController searchExpertiseController = TextEditingController();
  TextEditingController searchMemberController = TextEditingController();
  RxInt index = 0.obs;
  RxBool isSelected = false.obs;
  @override
  void onInit() async {
    var args = Get.arguments;
    if (args != null) {
      index.value = args['index'];
    }
    super.onInit();
  }
}
