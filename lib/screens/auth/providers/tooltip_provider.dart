import 'package:flutter/cupertino.dart';
import 'package:the_planet/generated/l10n.dart';

class TooltipProvider extends ChangeNotifier {
  String _tooltipMessage = "";
  String get message => _tooltipMessage;

  void updateMesage(int index) {
    _updateTooltipMessage(index);
    notifyListeners();
  }

  void _updateTooltipMessage(int index) {
     if (index == 0) {
      _tooltipMessage = S.current.username_tooltip;
    }
    else if (index == 1) {
       _tooltipMessage =  S.current.password_tooltip;
    }
    else if (index == 2) {
       _tooltipMessage =  S.current.confirm_pass_tooltip;
    }
    else {
       _tooltipMessage =  S.current.secret_word_tooltip;
    }
  }
}