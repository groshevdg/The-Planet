import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme appTextTheme() {
    return TextTheme(
       headline1: _headline1(),
       headline2: _headline2()
    );
  }

  static TextStyle _headline1() {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle _headline2() {
    return TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w400
    );
  }
}