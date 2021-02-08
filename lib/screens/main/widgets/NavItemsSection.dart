import 'package:flutter/material.dart';
import 'package:the_planet/screens/main/widgets/nav_item.dart';

class NavItemsSection extends StatefulWidget {
  final String title1;
  final String title2;
  final String icon1;
  final String icon2;
  final Alignment alignment;

  const NavItemsSection({Key key, this.title1, this.title2, this.icon1,
    this.icon2, this.alignment}) : super(key: key);

  @override
  _NavItemsSectionState createState() => _NavItemsSectionState();
}

class _NavItemsSectionState extends State<NavItemsSection> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: SizedBox(
        height: 70, width:  MediaQuery.of(context).size.width / 2.5,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: CustomNavItem(title: widget.title1, icon: widget.icon1),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 12),
              child: CustomNavItem(title: widget.title2, icon: widget.icon2),
            )
          ],
        ),
      ),
    );
  }
}
