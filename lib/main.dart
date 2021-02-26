import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_planet/config/theme.dart';
import 'package:the_planet/screens/auth/auth_screen.dart';
import 'package:the_planet/screens/intro/intro_screen.dart';
import 'package:the_planet/screens/main/main_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _initCrashlytics();
  runApp(PlanetApp());
}

Future<void> _initCrashlytics() async {
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

class PlanetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
         GlobalWidgetsLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,
         GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("ru", "")
      ],
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
        FirebaseCrashlytics.instance.log("some log");  
        FirebaseCrashlytics.instance.log("еще some log"); 
        FirebaseCrashlytics.instance.crash();
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