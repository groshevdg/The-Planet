import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:the_planet/config/colors.dart';
import 'package:the_planet/screens/main/widgets/bottom_nav_bar.dart';
import 'package:the_planet/screens/main/widgets/comics_fragment.dart';
import 'package:the_planet/screens/main/widgets/games_fragment.dart';
import 'package:the_planet/screens/main/widgets/rating_fragment.dart';
import 'package:the_planet/screens/main/widgets/stories_fragment.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  NavBarController navBarController;
  @override
  void initState() {
    navBarController = NavBarController(1);
    navBarController.addListener(() {
      setState(() {
        print(navBarController.selected.toString());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    navBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_BACKGROUND,
      appBar: AppBar(
        title: Text("Main"),
      ),
      bottomNavigationBar: CustomBottomNavBar(controller: navBarController),
      body: getBody(navBarController.selected),
    );
  }

  Widget getBody(int fragmentIndex) {
    if (fragmentIndex == 1) {
      return GamesFragment();
    }
    else if (fragmentIndex == 2) {
      return StoriesFragment();
    }
    else if (fragmentIndex == 3) {
      return ComicFragment();
    }
    else if (fragmentIndex == 4) {
      return RatingFragment();
    }
    else return Container();
  }
}