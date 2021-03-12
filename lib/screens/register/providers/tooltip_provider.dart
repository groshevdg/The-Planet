import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/misc/exceptions.dart';

@lazySingleton
class TooltipProvider extends ChangeNotifier {
  String _tooltipMessage = "";
  String get message => _tooltipMessage;

  void updateTooltipMessage(int index) {
    _updateTooltipMessage(index);
    notifyListeners();
  }

  void updateErrorMessage(Exception exception) {
    _updateErrorMessage(exception);
    notifyListeners();
  }

  void clearMessage() {
    _tooltipMessage = "";
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

  void _updateErrorMessage(Exception exception) {
    if (exception is NetworkIsNotAvailableException) {
      _tooltipMessage = Strings.network_isnt_available;
    }
    else if (exception is UserExistException) {
      _tooltipMessage = Strings.username_exist;
    }
    else if (exception is PasswordsNotEqualsException) {
      _tooltipMessage = Strings.password_isnt_equal;
    }
    else {
      _tooltipMessage = Strings.unknown_error;
    }
  }
}