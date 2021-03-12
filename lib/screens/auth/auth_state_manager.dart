import 'package:injectable/injectable.dart';
import 'package:the_planet/screens/auth/providers/error_provider.dart';

@injectable
class AuthStateManager {
  final AuthErrorProvider errorProvider;

  AuthStateManager(this.errorProvider);

  void updateUiState(
    Exception? exception // change error message depending of exception type
  ) {
    if (exception != null) {
      errorProvider.updateErrorMessage(exception);
    }
  }
}