import 'package:flutter/material.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/screens/auth/auth_controller.dart';

class AcceptAgreementWidget extends StatefulWidget {
  final AuthController authController;

  const AcceptAgreementWidget({
    Key? key,
    required this.authController
  }) : super(key: key);

  @override
  _AcceptAgreementWidgetState createState() => _AcceptAgreementWidgetState();
}

class _AcceptAgreementWidgetState extends State<AcceptAgreementWidget> {
  var _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 12),
      child: Row(
        children: [
          Expanded(child: Text(Strings.agreement_message)),
          Checkbox(value: _isChecked, onChanged: (value) {
            setState(() {
              widget.authController.checkBoxIsClicked(value);
              _isChecked = value!;
            });
          })
        ],
      ),
    );
  }
}