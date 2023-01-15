import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/material.dart';
import 'the_main_screen.dart';
import 'login_screen.dart';
import 'menu_animated.dart';
import 'Constens.dart';
import 'Creat_Accounts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// @dart=2.9


void main(){
runApp(Femonths());
}

class Femonths extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(357.0,821.0),
      builder:(context, child) {
        return MaterialApp(
          home: AnimatedDrawer(
            homePageXValue: 200,
            homePageYValue: 80,
            homePageAngle: -0.2,
            homePageSpeed:250,
            shadowXValue: 122,
            shadowYValue: 110,
            shadowAngle: -0.275,
            shadowSpeed: 550,
            openIcon: Container(
                margin: EdgeInsets.only(top: 10,left: 10),
                child: Icon(Icons.menu,color:KIconAppbarColor)),
            closeIcon: Container(
                child: Icon(Icons.arrow_back_ios,color: KIconAppbarColor)),
            shadowColor: Color(0xff434fba).withOpacity(0.2),
            backgroundGradient: LinearGradient(colors: [Colors.lightBlue,Colors.white60]
            ),
            menuPageContent: menu_animated(), //menu_animated
            homePageContent:homepagecontent() ,

          ),
        );
      }
      );

  }
}
