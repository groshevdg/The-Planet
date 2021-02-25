import 'package:flutter/material.dart';

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
          Text("I read and agree with agreement"),
          Spacer(),
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