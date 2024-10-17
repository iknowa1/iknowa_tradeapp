import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppFonts {
  static TextStyle getTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: "Mulish",
    );
  }

  static TextStyle light(double fontSize, Color color) {
    return getTextStyle(fontSize: fontSize, fontWeight: FontWeight.w300, color: color);
  }

  static TextStyle regular(double fontSize, Color color) {
    return getTextStyle(fontSize: fontSize, fontWeight: FontWeight.w400, color: color);
  }

  static TextStyle book(double fontSize, Color color) {
    return getTextStyle(fontSize: fontSize, fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.47)!, color: color);
  }

  static TextStyle medium(double fontSize, Color color) {
    return getTextStyle(fontSize: fontSize, fontWeight: FontWeight.w500, color: color);
  }

  static TextStyle semiBold(double fontSize, Color color) {
    return getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle bold(double fontSize, Color color) {
    return getTextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: color);
  }
}
