import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/config/routes.dart';
import 'package:the_planet/config/theme.dart';
import 'package:the_planet/di/injector.dart';
import 'package:the_planet/screens/intro/intro_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _initCrashlytics();
  initialInject();
  runApp(PlanetApp());
}

Future<void> _initCrashlytics() async {
  // enable crashlytics even for debug mode
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

class PlanetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
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