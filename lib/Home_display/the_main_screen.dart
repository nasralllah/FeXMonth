import 'dart:async';

import 'package:fexmonths/data/API_Backend/Provider/CartDelete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Home_display/Carsoul_loading.dart';


import '../Onboarding Screen UI.dart';
import '../Prudoct_display/Prudocts_Display.dart';
import '../Prudoct_display/Single_Product.dart';
import '../data/API_Backend/ApiPost.dart';
import '../data/API_Backend/Models/Catogry_Models.dart';
import '../data/API_Backend/Models/HomeStoresModel.dart';
import '../data/API_Backend/Models/Products_Model.dart';
import '../data/API_Backend/Models/news.dart';
import '../data/API_Backend/Provider/CreatAccountProvider.dart';
import '../data/API_Backend/Provider/the_main_provider.dart';
import '../utils/app_constants.dart';
import '../view/base_widget/Carsol_Slider.dart';
import '../view/base_widget/Product_widget.dart';
import '../view/base_widget/Rating_Widget.dart';
import 'SrotesDisplay.dart';
import 'The_App_Bar.dart';

/*int activedots = 0;
f*/ /*inal List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];*/
bool icon = true;

class homepagecontent extends StatefulWidget {


  @override
  State<homepagecontent> createState() => _homepagecontentState();
}
double? Rating;
List<News>? CarsolList;
List<Cateogory>? categoryList;
List<prducts>? prductList;
List<HomeStores>? homeStoresList;
Timer? _timer;
int Counter = 0;
// List<cartNumber>? cartNumberList;
class _homepagecontentState extends State<homepagecontent> {


  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        Counter++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    /* final List<Widget> imageSliders = imgList
        .map((item) => Shimmer.fromColors(
      highlightColor: Colo rs.white38,
              baseColor: Colors.grey.shade300,
              child: Container(
                margin:
                    EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 1.0.w),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0.w),
                        */ /*Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: buuldindecator(),
                  ),
                ),*/ /*
                      ],
                    )),
              ),
            ))
        .toList();*/
    return Consumer<CartProvider>(
      builder: (context, value, child) =>
     Consumer<MainHomePageProvider>(
       builder: (context, value, child) =>
  Scaffold(

          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverAppBar(
                  backgroundColor: Colors.white, flexibleSpace: App_Baar())
            ],
            body: SingleChildScrollView(
              child: Column(children: [
                CarsolList == null
                    ? const carsoulLoadin()
                    : Carsol_Slider(
                        CarsolList: CarsolList,
                    itemCount: CarsolList!.length),
                /*

                  },
                  ),*/
                //
                //
                //   /*CarouselSlider(
                //     options: CarouselOptions(
                //       animateToClosest: true,
                //       autoPlay: true,
                //       aspectRatio: 2.8,
                //       enlargeCenterPage: true,
                //       onPageChanged: (index, reason) {
                //         setState(() {
                //           activedots = index;
                //         });
                //       },
                //     ),
                //     items: imageSliders,
                //   ),*/
                // ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 100),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                    top: 10
                  ),
                  child: Text("Best Stores",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                ),
                homeStoresList == null
                    ? cardsLoading()
                    : Container(
                        height: 200,
                        //padding: EdgeInsets.only(left: 50,right: 50),
                        // margin: EdgeInsets.only(left: 50,right: 50),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeStoresList!.length,
                          itemBuilder: (context, index) {
                            return InkWell(

                              child: Container(
                                width: 160,
                                padding: EdgeInsets.only(left: 5),
                                /*decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1.0,
                                    blurRadius: 10.0,
                                    offset: Offset(0, 20.0)
                                  )]

                                ),*/
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(65.0),
                                          topLeft: Radius.circular(65.0),
                                          bottomLeft: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0))),
                                  // shadowColor: Colors.grey,

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(

                                        padding:  EdgeInsets.only(
                                            top: 4, left: 2, right: 2),
                                        child:  CircleAvatar(
                                          radius: 55.0,
                                          backgroundColor: KBlueColor,
                                          child: CircleAvatar(
                                            radius: 53.0,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 51,
                                              backgroundColor: Colors.black,
                                              child: homeStoresList == null? cardsLoading():
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    AppConstants.BASE_URL+ "${homeStoresList![index].profile.logourl}"

                                                ),
                                                radius: 50.0,
                                                backgroundColor: KGreyColor1,
                                                foregroundColor: KGreyColor1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Center(
                                        child: Text(homeStoresList![index].attributes.name,
                                            style: TextStyle(
                                                color: KBlueColor)),
                                      ),
                                      const Spacer(),
                                       Center(
                                        child: Text(homeStoresList![index].attributes.storename,
                                            style: TextStyle(
                                                color: KGreyColor3, fontSize: 10)),
                                      ),
                                      const Spacer(),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 5, bottom: 5),
                                            child: Rating_widget(
                                              ignoreGestures: false,
                                              direction: Axis.horizontal,
                                              itemSizw: 15.0,
                                              semetricPadding: 2.0,
                                              onRatingUpdate: (value) => setState(() {
                                                Rating = value;
                                              }),
                                              initialRating: Rating ?? 3.4,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(bottom: 5, right: 5),
                                            child: Text(
                                              "",
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 100),
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10
                  ),
                  child: const Text("Best Product",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                ),
                /*Container(
                 // height: double.infinity,

                  // padding: EdgeInsets.symmetric(horizontal: 100),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child:*/
                Column(
                  children: [
                    if (categoryList == null)
                      cardsLoading()
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: categoryList!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 5,
                                    top: 5
                                  ),
                                  child: Text(categoryList![index].attributes.category_name,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  height: 210,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: prductList!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 160,
                                        padding: EdgeInsets.only(left: 5),
                                        child: InkWell(
                                          onTap: () {
                                            Slug = prductList![index].Slug;

                                            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleProduct(Slugg:Slug ),));
                                            print("$Slug======================================================================================ads;ldsl");
                                          },
                                          child: Product_Widgit(
                                            title:
                                                prductList![index].attributes.title,
                                            ImageNetwork:
                                            AppConstants.BASE_URL+"${prductList![index].picture_url}",
                                            StoreName:
                                                prductList![index].store.Store_Name,
                                            discount: prductList![index].attributes.Discount,
                                            status:
                                                prductList![index].status,
                                            Price:
                                                prductList![index].attributes.price,
                                            cost: prductList![index].attributes.cost,
                                            Comments: prductList![index].comments.number,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                              )
                            ],
                          );
                        },
                      ),
                  ],

                  //)
                ),

                // buuldindecator(),
                /* FutureBuilder(future: Readjasondata(),
                    builder: (context,data)
                    {
                      if(data.hasError)
                      {
                        return Center(child: Text("${data.error}"),);

                      }
                      else if(data.hasData)
                      {
                        var items = data.data as List<products>;
                        return ListView.builder(
                            itemBuilder: (context , index)
                            {
                              return Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Image(image: AssetImage( "Images/Everything Everywhere All At Once (2022).jpg")),
                                        width: 50,
                                        height: 50,
                                      ),
                                      Expanded(child: Container(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                              EdgeInsets.only(left: 8,right: 8),
                                              child:
                                              Text("sld;fkgd;lfkg",
                                                  style:
                                                  TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold
                                                  )
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(left: 8,right: 8),
                                            child:
                                            Text("hidl;fgk;dflgk;dfl")
                                          )
                                          ],
                                        ),

                                      ))
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }
                      else
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }

                    },
                    )*/
              ]),
            ),
          ),
          bottomNavigationBar: BottomAppBar(

            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  border: Border.all(color: KGreyColor2),
                  boxShadow: [
                    BoxShadow(
                        color: KGreyColor2,
                        //offset: Offset(0, -1),
                        spreadRadius: 4,
                        blurRadius: 30)
                  ]),
              height: 80.0.h,
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  IconButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => prudoctsDisplay(),));
                      },
                      icon: ImageIcon(
                        AssetImage(AppConstants.selectedNavigatorPicList[0]),
                        color: KBlueColor,

                        size: 60,
                      )),
                  SizedBox(
                    width: 180.w,
                  ),
                  IconButton(
                      onPressed: () {
                        icon = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Stroes()));
                      },
                      icon: ImageIcon(
                        AssetImage(AppConstants.selectedNavigatorPicList[1]),
                        color: KBlueColor,
                        size: 60,
                      )),
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            height: 90.h,
            width: 60.w,
            child: FittedBox(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black , width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),                child: FloatingActionButton(
                    onPressed: () {


                      // print( SignUpProvider().token!);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) =>onbordingScreen() ,)) ;
                    },
                    splashColor: KBlueColor,
                  backgroundColor: KBlueColor,
                    child:  Center(
                        child:ImageIcon(
                          AssetImage(AppConstants.selectedNavigatorPicList[2]),
                          color: Colors.white,
                          size: 40,
                        )
                    )),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          /*FloatingActionButton(
            onPressed: () {},
            splashColor: Colors.blue,

            child: const Icon(Icons.house),*/
        ),
     ),
    );
  }
/*
Widget buuldindecator() => AnimatedSmoothIndicator(
        activeIndex: activedots,
        count: imgList.length,
        effect: SwapEffect(
          dotHeight: 10,
          dotWidth: 10,
        ),
      );*/
}
