import 'package:flutter/cupertino.dart';
import 'package:the_planet/utils/ui_utils.dart';

extension scaledTextStyle on TextStyle {
  TextStyle get scaled => copyWith(fontSize: fontSize! * UiUtils.scaleFactor);
}