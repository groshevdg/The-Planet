import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_planet/config/consts.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/di/injector.dart';
import 'package:the_planet/screens/register/register_controller.dart';
import 'package:the_planet/screens/register/providers/button_enable_provider.dart';
import 'package:the_planet/screens/register/providers/privacy_state_provider.dart';
import 'package:the_planet/screens/register/providers/tooltip_provider.dart';
import 'package:the_planet/screens/register/widgets/accept_agreement.dart';
import 'package:the_planet/screens/register/widgets/input_row.dart';
import 'package:the_planet/misc/extensions.dart';
import 'package:the_planet/utils/ui_utils.dart';


class RegisterScreen extends StatefulWidget {
  static const route = "register";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
  late Animation<Offset> _offsetAnimation;
  late AnimationController _animationController;

  @override
  void initState() { 
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _offsetAnimation = Tween<Offset>(begin: Offset(1000, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.fastLinearToSlowEaseIn));
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
              padding: EdgeInsets.only(top: UiUtils.scaleSize(60)),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(Strings.create_acc_message,
                    style: Theme.of(context).textTheme.headline1!.scaled
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UiUtils.defaultMargin, vertical:  UiUtils.defaultMargin / 3),
              child: Text(Strings.data_to_create_acc,
                style: Theme.of(context).textTheme.headline2!.scaled,
                textAlign: TextAlign.center
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: UiUtils.scaleSize(50), left: UiUtils.defaultMargin / 2, right: UiUtils.defaultMargin / 2),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    InputTextRow(hint: Strings.username_hint, authController: getIt<RegisterController>(), rowIndex: Consts.USERNAME_INDEX),
                    InputTextRow(hint: Strings.password_hint, authController: getIt<RegisterController>(), rowIndex: Consts.PASSWORD_INDEX),
                    InputTextRow(hint: Strings.confirm_pass_hint, authController: getIt<RegisterController>(), rowIndex: Consts.CONFIRM_PASS_INDEX),
                    InputTextRow(hint: Strings.secret_word, authController: getIt<RegisterController>(), rowIndex: Consts.SECRET_WORD_INDEX),
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
                  padding: EdgeInsets.symmetric(horizontal: UiUtils.defaultMargin),
                  child: Text(providerState.message,
                      style: Theme.of(context).textTheme.headline2!.scaled,
                      textAlign: TextAlign.center
                  ),
                );
              }),
            ),
            Spacer(),
            ChangeNotifierProvider(
                create: (context) => getIt<ButtonEnableProvider>(),
                child: Consumer<ButtonEnableProvider>(
                  builder: (context, state, child) {
                    return ElevatedButton(onPressed: state.isEnable ? () => getIt<RegisterController>().createButtonIsPressed(context) : null,
                        child: Text(Strings.create_acc_button, style: Theme.of(context).textTheme.headline2!.scaled)
                    );
                  },
                )
            ),
            Padding(padding: EdgeInsets.only(bottom: UiUtils.scaleSize(30), top: UiUtils.scaleSize(10)),
              child: TextButton(onPressed: () => getIt<RegisterController>().accountAlreadyCreatedIsPressed(),
                child: Text(Strings.already_created, style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.blue).scaled),
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
