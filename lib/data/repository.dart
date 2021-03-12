import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/misc/exceptions.dart';
import 'package:the_planet/misc/result.dart';

@lazySingleton
class Repository {
  Future<DocumentReference?> registerUser({
      required String username,
      required String password,
      required String secretWord}) async {

    await _checkNetworkAvailableOrThrow();
    await _validateUsernameOrThrow(username);
    return FirebaseFirestore.instance.collection(Consts.USERS_PATH)
        .add(_getUserJsonData(username, password, secretWord));
  }

  Future _validateUsernameOrThrow(String username) async {
    var query = await FirebaseFirestore.instance.collection(Consts.USERS_PATH).where(Consts.USERNAME_KEY, isEqualTo: username).get();
    if (query.size != 0) {
      throw UsernameExistException();
    }
  }

  Map<String, dynamic> _getUserJsonData(String username, String password, String secretWord) {
    return {Consts.USERNAME_KEY: username, Consts.PASSWORD_KEY: password, Consts.SECRET_WORD_KEY: secretWord};
  }

  Future<void> _checkNetworkAvailableOrThrow() async {
    var results = await Connectivity().checkConnectivity();
    if (results == ConnectivityResult.none) {
      throw NetworkIsNotAvailableException();
    }
  }

  Future<Result<String>> loginUser(String username, String password) async {
    await _checkNetworkAvailableOrThrow();
    var snapshot = await FirebaseFirestore.instance.collection(Consts.USERS_PATH)
      .where(Consts.USERNAME_KEY, isEqualTo: username)
      .where(Consts.PASSWORD_KEY, isEqualTo: password)
    .get();

    if (snapshot.docs.isNotEmpty) {
      return Result(isSuccessful: true, data: snapshot.docs[0].id);
    }
    else {
      throw UserNotExistException();
    }
  }
}
