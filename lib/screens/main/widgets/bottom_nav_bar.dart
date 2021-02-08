import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/screens/main/widgets/NavItemsSection.dart';
import 'package:the_planet/screens/main/widgets/circle_button.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              color: Colors.grey,
            ),
          ),
          CircleButton(),
          NavItemsSection(
            alignment: Alignment.bottomLeft,
            icon1: 'assets/images/play.png',
            icon2: 'assets/images/play.png',
            title1: 'item 1',
            title2: 'item 2',
          ),
          NavItemsSection(
            alignment: Alignment.bottomRight,
            icon1: 'assets/images/play.png',
            icon2: 'assets/images/play.png',
            title1: 'item 1',
            title2: 'item 2',
          )
        ],
      ),
    );
  }
}

