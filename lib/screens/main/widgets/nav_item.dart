import 'package:flutter/material.dart';

class CustomNavItem extends StatefulWidget {
  final String icon;
  final String title;

  const CustomNavItem({Key key, this.icon, this.title}) : super(key: key);

  @override
  _CustomNavItemState createState() => _CustomNavItemState();
}

class _CustomNavItemState extends State<CustomNavItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(widget.icon, width: 30),
        Text(widget.title)
      ],
    );
  }
}
