import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/screens/register/register_screen.dart';
import 'package:the_planet/screens/intro/widgets/intro_view_pager.dart';
import 'package:the_planet/utils/ui_utils.dart';
import 'package:the_planet/misc/extensions.dart';

class IntroScreen extends StatelessWidget {
  static const route = "intro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: UiUtils.scaleSize(90)),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(Strings.app_name, style: Theme.of(context).textTheme.headline1!.scaled)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: UiUtils.scaleSize(15)),
              color: Colors.green,
              height: MediaQuery.of(context).size.height * 0.6,
              child: IntroViewPager()
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: UiUtils.scaleSize(25)),
              child: ElevatedButton(
                onPressed: () {
                  openAuthScreen(context);
                },
                child: Text(Strings.start_button_title, style: Theme.of(context).textTheme.headline2!.scaled),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openAuthScreen(context) {
    Navigator.pushReplacementNamed(context, RegisterScreen.route);
  }
}