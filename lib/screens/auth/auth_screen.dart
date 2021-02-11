import 'package:flutter/material.dart';
import 'package:the_planet/screens/auth/input_row.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Let's create you account",
                    style: Theme.of(context).textTheme.headline1
                ),
              ),
            ),
            Text("Choose your username, password and keyword."
                "\nTap on a question icon to learn more.",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    InputTextRow(hint: "username"),
                    InputTextRow(hint: "password"),
                    InputTextRow(hint: "confirm password"),
                    InputTextRow(hint: "secret word"),
                  ],
                ),
              ),
            ),
            Spacer(),
            Text("Username will be visible for all users"),
            Spacer(),
            RaisedButton(onPressed: () {}, child: Text("create account")),
            Padding(padding: EdgeInsets.only(bottom: 30, top: 10),
              child: TextButton(onPressed: () {},
                child: Text("I have account"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
