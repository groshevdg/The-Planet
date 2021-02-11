import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GamesFragment extends StatefulWidget {
  @override
  _GamesFragmentState createState() => _GamesFragmentState();
}

class _GamesFragmentState extends State<GamesFragment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GridView.count(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        children: List.generate(10, (int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 250),
            delay: const Duration(milliseconds: 150),
            columnCount: 2,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: Container(color: Colors.grey),
              ),
            ),
          );
        }),
      ),
    );
  }
}
