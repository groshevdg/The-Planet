import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_planet/screens/main/widgets/nav_item_section.dart';
import 'package:the_planet/screens/main/widgets/circle_button.dart';

class CustomBottomNavBar extends StatefulWidget {
  final NavBarController controller;

  const CustomBottomNavBar({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              color: Colors.grey,
            ),
          ),
          CircleButton(itemId: 0, controller: widget.controller),
          NavItemsSection(
            id1: 1, id2: 2,
            alignment: Alignment.bottomLeft,
            icon1: 'assets/images/play.png',
            icon2: 'assets/images/play.png',
            title1: 'item 1',
            title2: 'item 2',
            navBarController: widget.controller,
          ),
          NavItemsSection(
            id1: 3, id2: 4,
            alignment: Alignment.bottomRight,
            icon1: 'assets/images/play.png',
            icon2: 'assets/images/play.png',
            title1: 'item 1',
            title2: 'item 2',
            navBarController: widget.controller,
          )
        ],
      ),
    );
  }
}

class NavBarController extends ChangeNotifier {
  late int _selectedItem;
  final int defaultSelectedItem;
  int get selected => _selectedItem;

  NavBarController(this.defaultSelectedItem) {
    _selectedItem = defaultSelectedItem;
  }

  void updateSelectedItem(int itemId) {
    _selectedItem = itemId;
    notifyListeners();
  }

  @override
  void dispose() {
    this.removeListener(() { });
    super.dispose();
  }
}