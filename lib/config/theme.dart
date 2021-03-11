import 'package:flutter/material.dart';

class AppTheme {
  static double _size16 = 16;
  static double _size18 = 18;
  static double _size20 = 20;
  static double _size25 = 25;

  static TextTheme appTextTheme() {
    return TextTheme(
       headline1: _headline1(),
       headline2: _headline2()
    );
  }

  static TextStyle _headline1() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _size25
    );
  }

  static TextStyle _headline2() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _size18
    );
  }
}