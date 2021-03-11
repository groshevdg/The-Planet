import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/config/consts.dart';

@lazySingleton
class Repository {
  Future<DocumentReference?> registerUser({
      required String username,
      required String password,
      required String secretWord}) async {

    await _validateUsernameOrThrow(username);
    return FirebaseFirestore.instance.collection(Consts.USERS_PATH)
        .add(_getUserJsonData(username, password, secretWord));
  }

  Future _validateUsernameOrThrow(String username) async {
    var query = await FirebaseFirestore.instance.collection(Consts.USERS_PATH).where(Consts.USERNAME_KEY, isEqualTo: username).get();

    if (query.size != 0) {
      throw Exception("Username exists in table");
    }
  }

  Map<String, dynamic> _getUserJsonData(String username, String password, String secretWord) {
    return {Consts.USERNAME_KEY: username, Consts.PASSWORD_KEY: password, Consts.SECRET_WORD_KEY: secretWord};
  }
}
