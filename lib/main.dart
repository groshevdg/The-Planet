import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/config/theme.dart';
import 'package:the_planet/screens/auth/auth_screen.dart';
import 'package:the_planet/screens/intro/intro_screen.dart';
import 'package:the_planet/screens/main/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PlanetApp());
}

class PlanetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:
      {'main' : (context) => MainScreen(),
      'auth' : (context) => AuthScreen()},
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: AppTheme.appTextTheme()
      ),
      home: AppStartRouteScreen(),
    );
  }
}

class AppStartRouteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: openScreen(),
        builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          return snapshot.data == 0 ? IntroScreen() : Container(color: Colors.green, width: 50, height: 50);
        }
        else {
          return CircularProgressIndicator();
        }
    });
  }

  Future<int> openScreen() async {
    return 0;
  }
}