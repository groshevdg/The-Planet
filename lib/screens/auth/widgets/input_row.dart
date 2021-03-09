import 'package:flutter/material.dart';
import 'package:the_planet/screens/auth/auth_controller.dart';

class InputTextRow extends StatefulWidget {
  final String hint;
  final AuthController authController;
  final int rowIndex;

  InputTextRow({Key? key,
  required this.hint,
  required this.authController,
  required this.rowIndex}) : super(key: key);

  @override
  _InputTextRowState createState() => _InputTextRowState();
}

class _InputTextRowState extends State<InputTextRow> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 40, width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                controller: _textEditingController,
                onChanged: (value) => widget.authController.finishTextEditing(widget.rowIndex, value),
                decoration: InputDecoration(
                    hintText: widget.hint
                ),
              )
          ),
          GestureDetector(
            onTap: () {
              widget.authController.questionIconIsPressed(widget.rowIndex, context);
            },
            child: Image.asset('assets/images/ic_question.png', width: 30, color: Colors.black)
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
