import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/screens/auth/auth_state_manager.dart';

@lazySingleton
class AuthController {
  final AuthScreenStateManager _stateManager;

  AuthController(this._stateManager);

  String? _usernameTextFiledValue;
  String? _passwordTextFiledValue;
  String? _confirmPassTextFiledValue;
  String? _secretWordTextFiledValue;
  bool? _checkboxValue = false;

  void questionIconIsPressed(int index, BuildContext context) {
    FocusScope.of(context).unfocus();
    _stateManager.updateUiState(tooltipNumber: index);
  }

  void finishTextEditing(int index, String value) {
    _setupTextEditingValues(index, value);
    _stateManager.updateUiState(isInputCorrect: _isInputCorrect(), shouldEnableButton: _isInputCorrect() && _checkboxValue!);
  }

  void checkBoxIsClicked(value) {
    _checkboxValue = value;
    _stateManager.updateUiState(shouldEnableButton: value && _isInputCorrect());
  }

  void createButtonIsPressed() {
    // todo register user
  }

  void accountAlreadyCreatedIsPressed() {
    // todo navigate
  }

  void _setupTextEditingValues(int index, String value) {
    if (index == Consts.USERNAME_INDEX) {
      _usernameTextFiledValue = value;
    }
    else if (index == Consts.PASSWORD_INDEX) {
      _passwordTextFiledValue = value;
    }
    else if (index == Consts.CONFIRM_PASS_INDEX) {
      _confirmPassTextFiledValue = value;
    }
    else {
      _secretWordTextFiledValue = value;
    }
  }

  bool _isInputCorrect() => _usernameTextFiledValue!.length > 4
      && _passwordTextFiledValue!.length > 5 && _confirmPassTextFiledValue == _passwordTextFiledValue
      && _secretWordTextFiledValue!.isNotEmpty;
}