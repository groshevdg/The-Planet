import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/di/injector.dart';
import 'package:the_planet/screens/auth/auth_controller.dart';
import 'package:the_planet/screens/auth/providers/button_enable_provider.dart';
import 'package:the_planet/screens/auth/providers/privacy_state_provider.dart';
import 'package:the_planet/screens/auth/providers/tooltip_provider.dart';
import 'package:the_planet/screens/auth/widgets/accept_agreement.dart';
import 'package:the_planet/screens/auth/widgets/input_row.dart';

class AuthScreen extends StatefulWidget {
  static const route = "auth";
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late Animation<Offset> _offsetAnimation;
  late AnimationController _animationController;

  @override
  void initState() { 
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _offsetAnimation = Tween<Offset>(begin: Offset(1000, 0), end: Offset(0, 0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastLinearToSlowEaseIn));
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
                child: Text(Strings.create_acc_message,
                    style: Theme.of(context).textTheme.headline1
                ),
              ),
            ),
            Text(Strings.data_to_create_acc,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    InputTextRow(hint: Strings.username_hint, authController: getIt<AuthController>(), rowIndex: Consts.USERNAME_INDEX),
                    InputTextRow(hint: Strings.password_hint, authController: getIt<AuthController>(), rowIndex: Consts.PASSWORD_INDEX),
                    InputTextRow(hint: Strings.confirm_pass_hint, authController: getIt<AuthController>(), rowIndex: Consts.CONFIRM_PASS_INDEX),
                    InputTextRow(hint: Strings.secret_word, authController: getIt<AuthController>(), rowIndex: Consts.SECRET_WORD_INDEX),
                  ],
                ),
              ),
            ),
            ChangeNotifierProvider(
                create: (context) => getIt<PrivacyMessageStateProvider>(),
                child: Consumer<PrivacyMessageStateProvider>(builder: (context, state, child)  {
                  if (state.shouldShow) {
                    _animationController.forward();
                  }
                  return SlideTransition(position: _offsetAnimation, child: AcceptAgreementWidget());
                })
            ),
            Spacer(),
            ChangeNotifierProvider(
              create: (context) => getIt<TooltipProvider>(),
              child: Consumer<TooltipProvider>(builder: (context, providerState, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(providerState.message),
                );
              }),
            ),
            Spacer(),
            ChangeNotifierProvider(
                create: (context) => getIt<ButtonEnableProvider>(),
                child: Consumer<ButtonEnableProvider>(
                  builder: (context, state, child) {
                    return ElevatedButton(onPressed: state.isEnable ? () {} : null,
                        child: Text(Strings.create_acc_button)
                    );
                  },
                )),
            Padding(padding: EdgeInsets.only(bottom: 30, top: 10),
              child: TextButton(onPressed: () {},
                child: Text(Strings.already_created),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
