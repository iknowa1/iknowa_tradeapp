import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toastification/toastification.dart';

class CustomToastification {
  //App related

  void showToast(String message, {ToastificationType type = ToastificationType.success}) {
    toastification.show(
      context: Get.context,
      type: type,
      title: Text(message),
      alignment: Alignment.bottomCenter,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      showProgressBar: false,
    );
  }
}
