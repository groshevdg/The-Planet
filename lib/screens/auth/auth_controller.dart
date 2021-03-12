import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/screens/auth/auth_state_manager.dart';
import 'package:the_planet/screens/main/main_screen.dart';
import 'package:the_planet/screens/remember_password/remember_password_screen.dart';
import 'package:the_planet/usecase/intro_usecase.dart';

@lazySingleton
class AuthController {
  final IntroUseCase _useCase;
  final AuthStateManager _stateManager;

  AuthController(this._useCase, this._stateManager);

  String? _username;
  String? _password;

  void rememberButtonIsPressed(BuildContext context) {
    Navigator.pushNamed(context, RememberPasswordScreen.route);
  }

  void loginButtonIsPressed(BuildContext context) async {
    var result = await _useCase.loginUser(_username!, _password!);
    if (result.isSuccessful) {
      Navigator.pushReplacementNamed(context, MainScreen.route);
    }
    else {
      _stateManager.updateUiState(result.exception);
    }
  }

  void onUsernameInputChange(value) {
    _username = value;
  }

  void onPasswordInputChange(value) {
    _password = value;
  }

  bool _isInputValid() {
    return _username!.length > 4 && _password!.length > 5;
  }
}