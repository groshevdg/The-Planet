import 'package:flutter/material.dart';
import 'package:the_planet/config/strings.dart';
import 'package:the_planet/di/injector.dart';
import 'package:the_planet/screens/register/register_controller.dart';
import 'package:the_planet/misc/extensions.dart';
import 'package:the_planet/utils/ui_utils.dart';


class AcceptAgreementWidget extends StatefulWidget {

  @override
  _AcceptAgreementWidgetState createState() => _AcceptAgreementWidgetState();
}

class _AcceptAgreementWidgetState extends State<AcceptAgreementWidget> {
  var _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: UiUtils.defaultMargin, right: UiUtils.defaultMargin / 2),
      child: Row(
        children: [
          Expanded(child: Text(Strings.agreement_message,
              style: Theme.of(context).textTheme.headline2!.scaled)
          ),
          Checkbox(value: _isChecked, onChanged: (value) {
            setState(() {
              getIt<RegisterController>().checkBoxIsClicked(value);
              _isChecked = value!;
            });
          })
        ],
      ),
    );
  }
}