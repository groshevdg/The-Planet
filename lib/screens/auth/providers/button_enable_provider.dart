import 'package:flutter/cupertino.dart';

class ButtonEnableProvider extends ChangeNotifier {
  bool _isButtonEnable = false;
  bool get isEnable => _isButtonEnable;

  void updateButtonState(bool enableState) {
    _isButtonEnable = enableState;
    notifyListeners();
  }
}