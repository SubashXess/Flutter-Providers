// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const Color APP_PRIMARY_TEXT_THEME = Colors.black;
const Color APP_SECONDARY_TEXT_THEME = Colors.black45;

class AppTextStyle {
  static TextStyle h0TextStyle(
      {Color color = APP_PRIMARY_TEXT_THEME,
      double size = 16.0,
      FontWeight fontWeight = FontWeight.normal,
      TextOverflow? overflow}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      overflow: overflow,
    );
  }
}

class AppBoxShadow {
  static BoxShadow s0BoxShadow(
      {Color color = Colors.black, double blurRadius = 14.0}) {
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
    );
  }
}

class AppContainerTheme {
  static const Color appContainerGreyTheme = Color(0xFFE7E7E9);
  static const Color appContainerDefaultTheme = Color(0xFFF3F3F6);
  static const Color appContainerBluishTheme = Color(0xFFE5E7EF);
}
