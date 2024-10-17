import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPhoneNumberController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxString countryCode = RxString("+44");

  @override
  void onInit() async {
    super.onInit();
  }
}
