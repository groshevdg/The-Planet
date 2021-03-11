import 'package:flutter/material.dart';
import 'package:the_planet/screens/register/register_controller.dart';
import 'package:the_planet/utils/ui_utils.dart';
import 'package:the_planet/misc/extensions.dart';

class InputTextRow extends StatefulWidget {
  final String hint;
  final RegisterController authController;
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
      padding: EdgeInsets.all(UiUtils.defaultMargin / 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: UiUtils.scaleSize(40), width: MediaQuery.of(context).size.width * 0.78,
              child: TextField(
                style: Theme.of(context).textTheme.headline2!.scaled,
                controller: _textEditingController,
                onChanged: (value) => widget.authController.finishTextEditing(widget.rowIndex, value),
                decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: Theme.of(context).textTheme.headline2!.scaled
                ),
              )
          ),
          GestureDetector(
            onTap: () {
              widget.authController.questionIconIsPressed(widget.rowIndex, context);
            },
            child: Image.asset('assets/images/ic_question.png', width: UiUtils.scaleSize(30), color: Colors.black)
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
