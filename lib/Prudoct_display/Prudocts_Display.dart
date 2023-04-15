import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../API_Backend/Home_API.dart';
import '../API_Backend/Models/CarsoleModels.dart';
import '../API_Backend/Models/news.dart';
import '../Components/Product_widget.dart';
import '../Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import '../Home_display/Carsoul_loading.dart';
import '../API_Backend/Provider/CarsolProvider.dart';
import 'package:provider/provider.dart';
import 'package:fexmonths/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fexmonths/Home_display/the_main_screen.dart';

import '../Home_display/The_App_Bar.dart';
import 'SideBar_menu_Products.dart';

class prudoctsDisplay extends StatefulWidget {
  const prudoctsDisplay({Key? key}) : super(key: key);

  @override
  State<prudoctsDisplay> createState() => _prudoctsDisplayState();
}

class _prudoctsDisplayState extends State<prudoctsDisplay> {


  @override
  void initState() {

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leading:  TextButton(onPressed: () {
              Navigator.pop(context);
              icon = true;
            }, child: Container(),),
              backgroundColor: Colors.white,
              flexibleSpace: App_Baar())
        ],
        body: SingleChildScrollView(
          child: Column(children: [
            /*Container(
              height: 40,
              color: Colors.blue,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                  ],
                ),
              ),
            ),*/

            Container(
            height: 465,
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.80,
                crossAxisSpacing: 5.50,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context,index) => Product_Widgit(title: 'hi', ImageNetwork: 'asjdklf', StoreName: 'sadf', discount: 'safd', status: 'sadf', Price: 234, cost: 234,)

            ),)

          ]),
        ),
      ),




      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70.0.h,
          child: Row(
            children: [
              SizedBox(
                width: 40.w,
              ),
              IconButton(
                  onPressed: () {
                  },
                  icon: Icon(
                    FontAwesomeIcons.tags,
                    color: Colors.grey,
                    size: 30,
                  )),
              SizedBox(
                width: 180.w,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.houseChimneyUser,
                    color: Colors.grey,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 90.h,
        width: 60.w,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
              },
              splashColor: Colors.blue,
              child: const Center(
                child: Icon(
                  Icons.store_mall_directory_outlined,
                  size: 40,
                ),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /*FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.blue,

        child: const Icon(Icons.house),*/
    );
  }

/* Widget buuldindecator() => AnimatedSmoothIndicator(
        activeIndex: activedots,
        count: imgList.length,
        effect: SwapEffect(
          dotHeight: 10,
          dotWidth: 10,
        ),
      );*/
}