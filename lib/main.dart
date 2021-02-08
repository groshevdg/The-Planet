import 'package:flutter/material.dart';
import 'package:the_planet/screens/intro_screen.dart';

void main() {
  runApp(PlanetApp());
}

class PlanetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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