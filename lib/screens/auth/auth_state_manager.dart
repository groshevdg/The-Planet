import 'package:injectable/injectable.dart';
import 'package:the_planet/screens/auth/providers/button_enable_provider.dart';
import 'package:the_planet/screens/auth/providers/privacy_state_provider.dart';

import 'providers/tooltip_provider.dart';

@lazySingleton
class AuthScreenStateManager {
  final TooltipProvider tooltipProvider;
  final PrivacyMessageStateProvider privacyMessageStateProvider;
  final ButtonEnableProvider buttonEnableProvider;

  AuthScreenStateManager(
    this.tooltipProvider,
    this.privacyMessageStateProvider,
    this.buttonEnableProvider
  );

  void updateUiState({
    int? tooltipNumber, // change tooltip message by a question icon click
    bool? isInputCorrect, // check all text fields typed correct to show agreement message,
    bool? shouldEnableButton // enable or disable button
  }) {
    if (tooltipNumber != null) {
      tooltipProvider.updateTooltipMessage(tooltipNumber);
    }

    if (isInputCorrect != null) {
      privacyMessageStateProvider.updatePrivacyMessageState(isInputCorrect);
    }

    if (shouldEnableButton != null) {
      buttonEnableProvider.updateButtonState(shouldEnableButton);
    }
  }
}