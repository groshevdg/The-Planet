import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/generated/l10n.dart';
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
  AuthController _authController;
  TooltipProvider _tooltipProvider;
  PrivacyMessageStateProvider _privacyMessageStateProvider;
  ButtonEnableProvider _buttonEnableProvider;
  Animation<Offset> _offsetAnimation;
  AnimationController _animationController;

  @override
  void initState() { 
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _offsetAnimation = Tween<Offset>(begin: Offset(1000, 0), end: Offset(0, 0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastLinearToSlowEaseIn));
    _tooltipProvider = TooltipProvider();
    _privacyMessageStateProvider = PrivacyMessageStateProvider();
    _buttonEnableProvider = ButtonEnableProvider();
    _authController = AuthController(
        context: context,
        tooltipProvider: _tooltipProvider,
        privacyMessageStateProvider: _privacyMessageStateProvider,
        buttonEnableProvider: _buttonEnableProvider);
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
                child: Text(S.of(context).create_acc_message,
                    style: Theme.of(context).textTheme.headline1
                ),
              ),
            ),
            Text(S.of(context).data_to_create_acc,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    InputTextRow(hint: S.of(context).username_hint, authController: _authController, rowIndex: Consts.USERNAME_INDEX),
                    InputTextRow(hint: S.of(context).password_hint, authController: _authController, rowIndex: Consts.PASSWORD_INDEX),
                    InputTextRow(hint: S.of(context).confirm_pass_hint, authController: _authController, rowIndex: Consts.CONFIRM_PASS_INDEX),
                    InputTextRow(hint: S.of(context).secret_word, authController: _authController, rowIndex: Consts.SECRET_WORD_INDEX),
                  ],
                ),
              ),
            ),
            ChangeNotifierProvider(
                create: (context) => _privacyMessageStateProvider,
                child: Consumer<PrivacyMessageStateProvider>(builder: (context, state, child)  {
                  if (state.shouldShow) {
                    _animationController.forward();
                  }
                  return  SlideTransition(position: _offsetAnimation, child: AcceptAgreementWidget(authController: _authController));
                })
            ),
            Spacer(),
            ChangeNotifierProvider(
              create: (context) => _tooltipProvider,
              child: Consumer<TooltipProvider>(builder: (context, providerState, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(providerState.message),
                );
              }),
            ),
            Spacer(),
            ChangeNotifierProvider(
                create: (context) => _buttonEnableProvider,
                child: Consumer<ButtonEnableProvider>(
                  builder: (context, state, child) {
                    return RaisedButton(onPressed: state.isEnable ? () {} : null,
                        child: Text(S.of(context).create_acc_button)
                    );
                  },
                )),
            Padding(padding: EdgeInsets.only(bottom: 30, top: 10),
              child: TextButton(onPressed: () {},
                child: Text(S.of(context).already_created),
              ),
            )
          ],
        ),
      ),
    );
  }
}
