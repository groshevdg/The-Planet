import 'package:flutter/material.dart';
import 'package:the_planet/screens/main/widgets/bottom_nav_bar.dart';

class CustomNavItem extends StatefulWidget {
  final String icon;
  final String title;
  final int itemId;
  final NavBarController controller;

  const CustomNavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.itemId,
    required this.controller}) : super(key: key);

  @override
  _CustomNavItemState createState() => _CustomNavItemState();
}

class _CustomNavItemState extends State<CustomNavItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(widget.icon, width: 27),
        Text(widget.title, style: TextStyle(color: widget.itemId == widget.controller.selected ? Colors.red : Colors.black))
      ],
    );
  }
}
