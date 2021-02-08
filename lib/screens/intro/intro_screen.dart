import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/screens/intro/widgets/intro_view_pager.dart';

class IntroScreen extends StatelessWidget {

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
                child: Text("The Planet")
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
                onPressed: () { openMainScreen(context); },
                child: Text("Go"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openMainScreen(context) {
    Navigator.pushNamed(context, 'main');
  }
}