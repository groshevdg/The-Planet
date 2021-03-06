import 'package:flutter/material.dart';
import 'package:the_planet/generated/l10n.dart';

class AcceptAgreemetWidget extends StatefulWidget {
  @override
  _AcceptAgreemetWidgetState createState() => _AcceptAgreemetWidgetState();
}

class _AcceptAgreemetWidgetState extends State<AcceptAgreemetWidget> {
  var _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 12),
      child: Row(
        children: [
          Flexible(child: Text(S.of(context).agreement_message)),
          Checkbox(value: _isChecked, onChanged: (value) {
            setState(() {
              _isChecked = value;
            });
          })
        ],
      ),
    );
  }
}