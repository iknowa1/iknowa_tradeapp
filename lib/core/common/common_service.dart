import 'package:flutter/cupertino.dart';

void removeFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

/// A [getTextStyle] This Method Use to getTextStyle
TextStyle getTextStyle(TextStyle mainTextStyle, double size) {
  return mainTextStyle.copyWith(fontSize: size);
}

/// A [validatePhone] widget is a widget that describes part of validate Phone number
bool validatePhone(String data) => RegExp(r'(^(?:[+0]9)?[0-9]{9,12}$)').hasMatch(data);

/// A [validateEmail] widget is a widget that describes part of validate Phone number
// bool validateEmail(String data) => RegExp(r'^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{2,6}\.)?[a-z]{2,6}$').hasMatch(data);
bool validateEmail(String data) => RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(data);

bool validatePassword(String data) => RegExp(r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$)').hasMatch(data);
