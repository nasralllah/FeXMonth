import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/material.dart';
import 'Home_display/the_main_screen.dart';
import 'Menu_display/menu_animated.dart';
import 'Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';


// @dart=2.9

void main() {
  runApp(Femonths());
}

class Femonths extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(357.0, 821.0),
        builder: (context, child) {
          return MaterialApp(
            home: AnimatedSplashScreen(
              duration: 3000,
              splash: Image.asset("Images/Group 5.png"),
              nextScreen: buildAnimatedDrawer(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: Alignment.topCenter,


            ),
          );
        });
  }

  AnimatedDrawer buildAnimatedDrawer() {
    return AnimatedDrawer(
            homePageXValue: 200,
            homePageYValue: 80,
            homePageAngle: -0.2,
            homePageSpeed: 250,
            shadowXValue: 122,
            shadowYValue: 110,
            shadowAngle: -0.275,
            shadowSpeed: 550,
            openIcon:Container(
            ),
            closeIcon: Container(),
            shadowColor: Color(0xff434fba).withOpacity(0.2),
            backgroundGradient:
                LinearGradient(colors: [Colors.lightBlue, Colors.white60]),
            menuPageContent: menu_animated(), //menu_animated
            homePageContent: homepagecontent(),
          );
  }
}
