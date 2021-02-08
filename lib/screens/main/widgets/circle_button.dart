import 'package:flutter/material.dart';
import 'package:the_planet/config/colors.dart';

class CircleButton extends StatefulWidget {
  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 85, height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.WHITE_BACKGROUND,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: const EdgeInsets.only(top: 5),
              width: 75, height: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red
              )
          ),
        ),
      ],
    );
  }
}
