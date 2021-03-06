import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/generated/l10n.dart';
import 'package:the_planet/screens/auth/auth_screen.dart';
import 'package:the_planet/screens/intro/widgets/intro_view_pager.dart';

class IntroScreen extends StatelessWidget {
  static const route = "intro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 90),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(S.of(context).app_name)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.green,
              height: MediaQuery.of(context).size.height * 0.6,
              child: IntroViewPager()
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: RaisedButton(
                onPressed: () {
                  openAuthScreen(context);
                },
                child: Text(S.of(context).start_button_title),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openAuthScreen(context) {
    Navigator.pushReplacementNamed(context, AuthScreen.route);
  }
}