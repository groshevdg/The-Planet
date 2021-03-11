import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_planet/config/consts.dart';

class PrefsUtils {
  static Future<void> insertAuthToken(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Consts.TOKEN_KEY, token);
  }
}