import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StoriesFragment extends StatefulWidget {
  @override
  _StoriesFragmentState createState() => _StoriesFragmentState();
}

class _StoriesFragmentState extends State<StoriesFragment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimationLimiter(
        child: ListView.builder(itemCount: 10, itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(duration: Duration(milliseconds: 400),
              position: index, child: SlideAnimation(
                horizontalOffset: 150,
                verticalOffset: 150,
                child: FadeInAnimation(
                  duration: Duration(milliseconds: 400),
                  child: Container(
                  width: 150, height: 150, color: Colors.amber, margin: EdgeInsets.only(top: 10),
          ))));
        }),
      ),
    );
  }
}
