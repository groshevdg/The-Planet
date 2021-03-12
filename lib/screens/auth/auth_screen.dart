import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/di/injector.dart';
import 'package:the_planet/screens/auth/auth_controller.dart';
import 'package:the_planet/screens/auth/providers/error_provider.dart';
import 'package:the_planet/utils/ui_utils.dart';
import 'package:the_planet/misc/extensions.dart';

class AuthScreen extends StatefulWidget {
  static const route = "auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(padding: EdgeInsets.only(top: UiUtils.scaleSize(60)),
            child: Text(Strings.login_message, style: Theme.of(context).textTheme.headline1!.scaled),
          ),
          Container(child: TextField(
            controller: _usernameController,
            onChanged: (value) => getIt<AuthController>().onUsernameInputChange(value),
            decoration: InputDecoration(
              hintText: Strings.username_hint
            ),
          ),
          margin: EdgeInsets.only(top: UiUtils.scaleSize(50), left: UiUtils.defaultMargin, right: UiUtils.defaultMargin)),
          Container(child: TextField(
            controller: _passwordController,
            onChanged: (value) => getIt<AuthController>().onPasswordInputChange(value),
            decoration: InputDecoration(
                hintText: Strings.password_hint
            ),
          ),
          margin: EdgeInsets.only(top: UiUtils.scaleSize(10), left: UiUtils.defaultMargin, right: UiUtils.defaultMargin)),
          Padding(
            padding: EdgeInsets.only(right: UiUtils.defaultMargin, top: UiUtils.scaleSize(10)),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(child: Text(Strings.remember_pass_btn),
                  onPressed: () => getIt<AuthController>().rememberButtonIsPressed(context)),
            ),
          ),
          Spacer(),
          ChangeNotifierProvider(
            create: (context) => getIt<AuthErrorProvider>(),
            child: Consumer<AuthErrorProvider>(
              builder: (context, state, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: UiUtils.defaultMargin),
                  child: Text(state.errorMessage, textAlign: TextAlign.center),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: UiUtils.scaleSize(25)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text(Strings.login_message),
                onPressed: () => getIt<AuthController>().loginButtonIsPressed(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
