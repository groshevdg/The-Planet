import 'package:injectable/injectable.dart';
import 'package:the_planet/data/repository.dart';
import 'package:the_planet/misc/exceptions.dart';
import 'package:the_planet/misc/result.dart';
import 'package:the_planet/utils/prefs_utils.dart';

@lazySingleton
class IntroUseCase {

  final Repository _repository;

  IntroUseCase(this._repository);

  Future<Result> registerUser({
    required String username,
    required String password,
    required String confirmedPassword,
    required String secretWord
  }) async {
    /// returns is register complete successful
    try {
      _validatePasswordOrThrow(password, confirmedPassword);
      var response = await _repository.registerUser(username: username, password: password, secretWord: secretWord);
      if (response != null) {
        await PrefsUtils.insertAuthToken(response.id);
        return Result(isSuccessful: true);
      }
      else return Result(isSuccessful: false, exception: UnknownError());
    } on Exception catch (e) {
      return Result(isSuccessful: false, exception: e);
    }
  }

  void _validatePasswordOrThrow(password, confirmedPassword) {
    if (password != confirmedPassword) throw PasswordsNotEqualsException();
  }
}