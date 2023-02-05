import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_display/the_main_screen.dart';
import 'Menu_display/menu_animated.dart';
import 'Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fexmonths/Onboarding Screen UI.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fexmonths/Onboarding Screen UI.dart';



// @dart=2.9

/*void main() {
  runApp(Femonths());
}*/
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final perf = await SharedPreferences.getInstance();
  final showHome= perf.getBool('showHome')?? false;

  runApp(Femonths(showHome: showHome));

}
class Femonths extends StatelessWidget {
  final bool showHome;
  const Femonths({Key? key,required this.showHome}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: AnimatedSplashScreen(
              duration: 3000,
              splash: Image.asset("Images/Group 5.png"),
              nextScreen: showHome ? buld_anmated_drawer() :
              onbordingScreen(),
              splashTransition: SplashTransition.fadeTransition,


            ),
          );
        }
  }

class buld_anmated_drawer extends StatelessWidget {
  const buld_anmated_drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(357.0, 821.0),
    builder: (context, child) {
      return AnimatedDrawer(
        homePageXValue: 200,
        homePageYValue: 80,
        homePageAngle: -0.2,
        homePageSpeed: 250,
        shadowXValue: 122,
        shadowYValue: 110,
        shadowAngle: -0.275,
        shadowSpeed: 550,
        openIcon: Container(
        ),
        closeIcon: Container(),
        shadowColor: Color(0xff434fba).withOpacity(0.2),
        backgroundGradient:
        LinearGradient(colors: [Colors.lightBlue, Colors.white60]),
        menuPageContent: menu_animated(),
        //menu_animated
        homePageContent: homepagecontent(),
      );
    }
      );
    }

        }