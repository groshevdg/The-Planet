import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ComicFragment extends StatefulWidget {
  @override
  _ComicFragmentState createState() => _ComicFragmentState();
}

class _ComicFragmentState extends State<ComicFragment> {
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
                child: Container(color: Colors.black12),
              ),
            ),
          );
        }),
      ),
    );;
  }
}
