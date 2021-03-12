import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/misc/exceptions.dart';

@lazySingleton
class AuthErrorProvider extends ChangeNotifier {
  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void updateErrorMessage(Exception exception) {
    if (exception is NetworkIsNotAvailableException) {
      _errorMessage = Strings.network_isnt_available;
    }
    else if (exception is UserNotExistException) {
      _errorMessage = Strings.user_isnt_exist;
    }
    else {
      _errorMessage = Strings.unknown_error;
    }
    notifyListeners();
  }
}