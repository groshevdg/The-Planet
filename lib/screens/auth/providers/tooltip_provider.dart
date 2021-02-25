import 'package:flutter/cupertino.dart';

class TooltipProvider extends ChangeNotifier {
  String _tooltipMessage = "";
  String get message => _tooltipMessage;

  void updateMesage(int index) {
    _updateTooltipMessage(index);
    notifyListeners();
  }

  void _updateTooltipMessage(int index) {
     if (index == 0) {
      _tooltipMessage = "Message1";
    }
    else if (index == 1) {
       _tooltipMessage = "Message2";
    }
    else if (index == 2) {
       _tooltipMessage = "Message3";
    }
    else {
       _tooltipMessage = "Message4";
    }
  }
}