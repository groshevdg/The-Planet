import 'package:flutter/cupertino.dart';

class IntroViewPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Container(
          child: Text('1'),
        ),
        Container(
          child: Text('2'),
        ),
        Container(
          child: Text('3'),
        ),
        Container(
          child: Text('4'),
        ),
        Container(
          child: Text('5'),
        ),
      ],
    );
  }
}