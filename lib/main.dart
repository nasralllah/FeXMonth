import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/material.dart';
import 'the_main_screen.dart';
import 'login_screen.dart';
import 'menu_animated.dart';
import 'Constens.dart';
// @dart=2.9


void main(){
runApp(Femonths());
}

class Femonths extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      AnimatedDrawer(
        homePageXValue: 200,
        homePageYValue: 80,
        homePageAngle: -0.2,
        homePageSpeed:250,
        shadowXValue: 122,
        shadowYValue: 110,
        shadowAngle: -0.275,
        shadowSpeed: 550,
        openIcon: Icon(Icons.menu,color:KIconAppbarColor),
        closeIcon: Icon(Icons.arrow_back_ios,color: KIconAppbarColor),
        shadowColor: Color(0xff434fba).withOpacity(0.2),
        backgroundGradient: LinearGradient(colors: [Colors.lightBlue,Colors.white60]
        ),
        menuPageContent: menu_animated(), //menu_animated
        homePageContent:homepagecontent() ,

      ),
    );
  }
}
