import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:the_planet/config/colors.dart';
import 'package:the_planet/screens/main/widgets/bottom_nav_bar.dart';

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
      body: navBarController.selected == 1 ? SizedBox.expand(
        child: GridView.count(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          children: List.generate(10, (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 400),
                delay: const Duration(milliseconds: 300),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Container(color: Colors.grey),
                  ),
                ),
              );
            },
          ),
        ),
      ) : Container(),
    );
  }
}