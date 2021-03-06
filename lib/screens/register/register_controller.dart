import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/screens/auth/auth_screen.dart';
import 'package:the_planet/screens/main/main_screen.dart';
import 'package:the_planet/screens/register/register_state_manager.dart';
import 'package:the_planet/usecase/intro_usecase.dart';

@lazySingleton
class RegisterController {
  final RegisterScreenStateManager _stateManager;
  final IntroUseCase _introUseCase;

  RegisterController(this._stateManager, this._introUseCase);

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

  void createButtonIsPressed(BuildContext context) async {
    _stateManager.updateUiState(clearFlag: true);
    var result = await _introUseCase.registerUser(username: _usernameTextFiledValue!,
        password: _passwordTextFiledValue!, secretWord: _secretWordTextFiledValue!,
        confirmedPassword: _confirmPassTextFiledValue!);

    if (result.isSuccessful) {
      Navigator.of(context).pushReplacementNamed(MainScreen.route);
    }
    else {
      Future.delayed(Duration(milliseconds: 250), () => _stateManager.updateUiState(exception: result.exception));
    }
  }

  void accountAlreadyCreatedIsPressed(BuildContext context) {
    Navigator.pushReplacementNamed(context, AuthScreen.route);
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
      && _passwordTextFiledValue!.length > 5 && _passwordTextFiledValue!.isNotEmpty
      && _secretWordTextFiledValue!.isNotEmpty;
}