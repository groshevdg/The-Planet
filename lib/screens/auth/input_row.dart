import 'package:flutter/material.dart';

class InputTextRow extends StatefulWidget {
  final String hint;

  const InputTextRow({Key key, @required this.hint}) : super(key: key);

  @override
  _InputTextRowState createState() => _InputTextRowState();
}

class _InputTextRowState extends State<InputTextRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 40, width: MediaQuery.of(context).size.width * 0.75,
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: widget.hint
                  ),
                ),
              )
          ),
          Image.asset('assets/images/play.png', width: 30)
        ],
      ),
    );
  }
}
