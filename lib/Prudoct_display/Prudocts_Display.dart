import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../API_Backend/Home_API.dart';
import '../API_Backend/Models/AllProductDisplayModel.dart';
import '../API_Backend/Models/CarsoleModels.dart';
import '../API_Backend/Models/news.dart';
import '../API_Backend/Provider/AllProductsDisplayProvider.dart';
import '../Components/Product_widget.dart';
import '../Components/Rating_Widget.dart';
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

import '../Home_display/SrotesDisplay.dart';
import '../Home_display/The_App_Bar.dart';
import 'SideBar_menu_Products.dart';

class prudoctsDisplay extends StatefulWidget {
  const prudoctsDisplay({Key? key}) : super(key: key);

  @override
  State<prudoctsDisplay> createState() => _prudoctsDisplayState();
}

List<AllProductDisplayModel>? productDisplayList;
class _prudoctsDisplayState extends State<prudoctsDisplay> {

  @override
  void initState() {
    AllProductsDisplayProvider(Dio()).getAll().then((value) {
      setState(() {});
      productDisplayList = [];
      productDisplayList!.addAll(value);
      print("___________________________________________");
      print(value);
      print("___________________________________________lds;kaf;lsakf;lskdf;lsdkf;sdf");
      print(value.length);
    });
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

            if(productDisplayList== null)
              cardsLoading()
            else
          Container(
            height: 465,
            child: GridView.builder(
              itemCount: productDisplayList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.80,
                crossAxisSpacing: 5.50,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context,index) =>
                  Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          side: BorderSide(color: Colors.grey.withOpacity(0.4))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: Text(productDisplayList![index].attributes.title),
                              ),
                             /* productDisplayList![index].attributes.discount == null
                                  ? Container():*/
                                  Container(
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.4),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(3.0))),
                                margin: EdgeInsets.only(right: 10, top: 5),
                                child: Center(
                                    child: Text(productDisplayList![index].attributes.discount ==" " ?" " :"${productDisplayList![index].attributes.discount}",
                                        style: TextStyle(color: Colors.green))),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            width: 130,
                            height: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                child: Image.network(
                                  "http://10.0.2.2:8000${ productDisplayList![index].picture_url}",
                                  fit: BoxFit.fitHeight,
                                )),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10, top: 5, right: 5),
                            child: Text(
                              productDisplayList![index].store.name,
                              style: TextStyle(color: Colors.blue, fontSize: 13),
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10, top: 5, right: 5),
                            child: Text(
                              productDisplayList![index].attributes.status,
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "${productDisplayList![index].attributes.price}",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${productDisplayList![index].attributes.cost}",
                                style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    fontSize: 13),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 10, bottom: 5),
                                  child: const Rating_widget(
                                      initialRating: 1.5,
                                    ignoreGestures: true,
                                    itemSizw: 10.0,
                                    semetricPadding: 2.0,
                                    direction: Axis.horizontal,
                                  )),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Icon(FontAwesomeIcons.solidComment,
                                    size: 15, color: Colors.blue),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: Text(
                                  "${productDisplayList![index].comments.number}",
                                  style: TextStyle(fontSize: 10, color: Colors.grey),
                                ),
                              )
                            ],
                          )
                        ],
                      ))

            ),)

          ]),
        ),
      ),




      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration:  BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              border: Border.all(
                  color: Colors.grey.shade400),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    //offset: Offset(0, -1),
                    spreadRadius: 4,
                    blurRadius: 30
                )
              ]
          ),
          height: 80.0.h,
          child: Row(
            children: [
              SizedBox(
                width: 40.w,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Stroes(),));
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
                  onPressed: () {
                    icon = false;
                  },
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


                 Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Stroes(),
                //     ));
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