import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PrivacyMessageStateProvider extends ChangeNotifier {
  bool _shouldShow = false;
  bool get shouldShow => _shouldShow;

  void updatePrivacyMessageState(bool isInputCorrect) {
    if (!_shouldShow && isInputCorrect) {
      _shouldShow = true;
      notifyListeners();
    }
  }
}