import 'package:injectable/injectable.dart';
import 'package:the_planet/data/repository.dart';
import 'package:the_planet/utils/prefs_utils.dart';

@lazySingleton
class IntroUseCase {

  final Repository _repository;

  IntroUseCase(this._repository);

  Future<bool> registerUser({
    required String username,
    required String password,
    required String secretWord
  }) async {
    /// returns is register complete successful
    try {
      var response = await _repository.registerUser(username: username, password: password, secretWord: secretWord);
      if (response != null) {
        await PrefsUtils.insertAuthToken(response.id);
        return true;
      }
      else return false;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}