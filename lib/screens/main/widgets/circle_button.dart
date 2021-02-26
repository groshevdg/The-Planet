import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_planet/config/colors.dart';
import 'package:the_planet/screens/main/widgets/bottom_nav_bar.dart';
import 'package:the_planet/screens/main/widgets/nav_item.dart';

class CircleButton extends StatefulWidget {
  final int itemId;
  final NavBarController controller;

  const CircleButton({Key key, @required this.itemId, @required this.controller}) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        widget.controller.updateSelectedItem(widget.itemId);
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 75, height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.WHITE_BACKGROUND,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 8),
              margin: const EdgeInsets.only(top: 4),
              width: 67, height: 67,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
              child: CustomNavItem(icon: 'assets/images/play.png', title: "Wiki", controller: widget.controller, itemId: widget.itemId),
            ),
          ),
        ],
      ),
    );
  }
}
