import 'package:flutter/cupertino.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/config/strings.dart';

class TooltipProvider extends ChangeNotifier {
  String _tooltipMessage = "";
  String get message => _tooltipMessage;

  void updateTooltipMessage(int index) {
    _updateTooltipMessage(index);
    notifyListeners();
  }

  void _updateTooltipMessage(int index) {
     if (index == Consts.USERNAME_INDEX) {
      _tooltipMessage = Strings.username_tooltip;
    }
    else if (index == Consts.PASSWORD_INDEX) {
       _tooltipMessage =  Strings.password_tooltip;
    }
    else if (index == Consts.CONFIRM_PASS_INDEX) {
       _tooltipMessage =  Strings.confirm_pass_tooltip;
    }
    else {
       _tooltipMessage =  Strings.secret_word_tooltip;
    }
  }
}