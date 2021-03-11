import 'package:flutter/cupertino.dart';
import 'package:the_planet/screens/register/register_screen.dart';
import 'package:the_planet/screens/main/main_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    MainScreen.route : (context) => MainScreen(),
    RegisterScreen.route : (context) => RegisterScreen()
  };
}