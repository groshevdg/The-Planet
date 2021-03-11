import 'package:flutter/cupertino.dart';

class UiUtils {
  static const _defaultHeight = 800;
  static double defaultMargin = 24;
  static late double scaleFactor;

  static void init(BuildContext context) {
    scaleFactor = MediaQuery.of(context).size.height / _defaultHeight;
  }

  static double scaleSize(double size) {
    return size * scaleFactor;
  }
}