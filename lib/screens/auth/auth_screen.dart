import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_planet/screens/auth/auth_controller.dart';
import 'package:the_planet/screens/auth/providers/tooltip_provider.dart';
import 'package:the_planet/screens/auth/widgets/accept_agreement.dart';
import 'package:the_planet/screens/auth/widgets/input_row.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  AuthController _authController;
  TooltipProvider _tooltipProvider;
  Animation<Offset> _offsetAnimation;
  AnimationController _animationController;

  @override
  void initState() { 
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    _offsetAnimation = Tween<Offset>(begin: Offset(1000, 0), end: Offset(0, 0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastLinearToSlowEaseIn));
    _tooltipProvider = TooltipProvider();
    _authController = AuthController(tooltipProvider: _tooltipProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    InputTextRow(hint: "username", authController: _authController, rowIndex: 0),
                    InputTextRow(hint: "password", authController: _authController, rowIndex: 1),
                    InputTextRow(hint: "confirm password", authController: _authController, rowIndex: 2),
                    InputTextRow(hint: "secret word", authController: _authController, rowIndex: 3),
                  ],
                ),
              ),
            ),
            SlideTransition(position: _offsetAnimation, child: AcceptAgreemetWidget()),
            Spacer(),
            ChangeNotifierProvider(
              create: (context) => _tooltipProvider,
              child: Consumer<TooltipProvider>(builder: (context, providerState, child) {
                return Text(providerState.message);
              }),
            ),
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
