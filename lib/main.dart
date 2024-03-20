import 'dart:async';

import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:dio/dio.dart';
import 'package:fexmonths/data/API_Backend/ApiPost.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constens.dart';
import 'Home_display/CartDisplay.dart';
import 'Home_display/the_main_screen.dart';
import 'Menu_display/menu_animated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fexmonths/Onboarding Screen UI.dart';

import 'Pay_ment/Alet_CheckOut.dart';
import 'data/API_Backend/Provider/CarsolProvider.dart';
import 'data/API_Backend/Provider/CartDelete.dart';
import 'data/API_Backend/Provider/CartDisplayProvider.dart';
import 'data/API_Backend/Provider/Category_Provider.dart';
import 'data/API_Backend/Provider/CreatAccountProvider.dart';
import 'data/API_Backend/Provider/HomeStoresProvider.dart';
import 'data/API_Backend/Provider/Products_Provider.dart';
import 'data/API_Backend/Provider/myAddressProvider.dart';
import 'data/API_Backend/Provider/orderes_provider.dart';
import 'data/API_Backend/Provider/src/GetCoomentProvider.dart';
import 'data/API_Backend/Provider/the_main_provider.dart';



// @dart=2.9

/*void main() {
  runApp(Femonths());*/

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<carsoleProvider>(create: (_) =>carsoleProvider(Dio()),),
        ChangeNotifierProvider<SignUpProvider>(create: (_) =>SignUpProvider(),),
        ChangeNotifierProvider<CartProvider>(create: (_) =>CartProvider(),),
        ChangeNotifierProvider<MainHomePageProvider>(create: (_) =>MainHomePageProvider(),),
        ChangeNotifierProvider<OrderProvider>(create: (_) =>OrderProvider(),),
        ChangeNotifierProvider<CartDisplayProviders>(create: (_) =>CartDisplayProviders(Dio()))
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
              home: AnimatedSplashScreen(
                duration: 3000,
                splash: Image.asset("Images/Group 5.png"),
                nextScreen: showHome ? buld_anmated_drawer() :
                onbordingScreen(),
                splashTransition: SplashTransition.fadeTransition,


              ),
            ),
    );
        }
  }

class buld_anmated_drawer extends StatefulWidget {


  @override
  State<buld_anmated_drawer> createState() => _buld_anmated_drawerState();
}

class _buld_anmated_drawerState extends State<buld_anmated_drawer> {
Timer? _timer;
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        Counter++;
      });
    });
    CommentsRatingProvider(Dio()).getAll(Slug: Slug);
    carsoleProvider(Dio()).getAll().then((value) {
      setState(() {});

      // Carsollist = value;
      CarsolList = [];
      CarsolList!.addAll(value);
      print('=======================CarsolList========================CarsolList==============CarsolList===============CarsolList=============CarsolList===========CarsolList');
      print(value);
      print('=======================CarsolList===========================CarsolList==========CarsolList===============CarsolList==============CarsolList');
    });
    CategoryProvider(Dio()).getAll().then((valueofcategory) {
      setState(() {});

      categoryList = [];
      categoryList!.addAll(valueofcategory);
      print('=======================');
      print(valueofcategory);
      print('=======================');
    });
    //for(int i =1; i<=2;i++){

    var provider = ProductsProvider(Dio());
    for (var id = 2; id<= 3;id++){
    ProductsProvider(Dio()).getAll(id).then((value) {
      setState(() {});
      prductList = [];
      prductList!.addAll(value);
      print('=======================');
      print(value);
      print('=======================');

    });
    }
    //}
    HomeStoresProvider(Dio()).getAll().then((value) {
      setState(() {});
      homeStoresList = [];
      homeStoresList!.addAll(value);
      print('=======homeStoresList======homeStoresList======homeStoresList====');
      print(value);
      print('====homeStoresList=======homeStoresList======homeStoresList======');
    });

    CartDisplayProviders(Dio()).getAll().then((value) {
      setState((){});
      cartDisplaylist = [];
      cartDisplaylist!.addAll(value);
      print("=================cartDisplaylist=======================cartDisplaylist====================cartDisplaylist");
      print(value);
      print("=================cartDisplaylist=======================cartDisplaylist====================cartDisplaylist");

    });
    myAddressProvider(
      Dio(),
    ).getAll().then((value) {
      setState(() {});
      myAddressModelList = [];
      myAddressModelList!.addAll(value);
      print(
          "=======myAddressModelList============myAddressModelList===================myAddressModelList");
      print(value);
      print(
          "=======myAddressModelList============myAddressModelList===================myAddressModelList");
    });

  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

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


        shadowColor: Color(0xff434fba).withOpacity(0.2),
        backgroundGradient:
        LinearGradient(colors: [Colors.lightBlue, Colors.white60]),
        menuPageContent: menu_animated(),
        //menu_animated
        homePageContent:  homepagecontent(),
      );
    }
      );
    }
}