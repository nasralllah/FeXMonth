import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../API_Backend/Home_API.dart';
import '../API_Backend/Models/CarsoleModels.dart';
import '../API_Backend/Models/news.dart';
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

/*int activedots = 0;
f*/ /*inal List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];*/

class homepagecontent extends StatefulWidget {
  const homepagecontent({Key? key}) : super(key: key);

  @override
  State<homepagecontent> createState() => _homepagecontentState();
}

class _homepagecontentState extends State<homepagecontent> {
  List<News>? Carsollist;
  double? Rating;


  @override
  void initState() {
    carsoleProvider(Dio()).getAll().then((value) {
      setState(() {

      });

      // Carsollist = value;
      Carsollist = [];
      Carsollist!.addAll(value);
      print('=======================');
      print(value);
      print('=======================');
    });

    super.initState();
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
    var carsoleProviders = Provider.of<carsoleProvider>(context, listen: false);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //color: Colors.red,
                    // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 40.h, left: 10.w),
                    child: Icon(
                      Icons.menu,
                      color: KIconAppbarColor,
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 40.h, left: 40.w),
                    child: Icon(
                      Icons.notifications_on_outlined,
                      color: KIconAppbarColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40.h, left: 20.w),
                    child: Image(
                      //   alignment:Alignment.center,
                      image: AssetImage("Images/Group 5.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    //  alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 40.h, left: 15.w),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: KIconAppbarColor,
                    ),
                  ),
                  Container(
                    // alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 40.h, left: 30.w),
                    child: Icon(
                      Icons.search,
                      color: KIconAppbarColor,
                    ),
                  ),
                ],
              ))
        ],
        body: SingleChildScrollView(
          child: Column(children: [
            Carsollist == null
                ? cardsLoading()
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      animateToClosest: true,
                      autoPlay: true,
                      aspectRatio: 2.8,
                      enlargeCenterPage: true,
                      /* onPageChanged: (index, reason) {
            setState(() {
    activedots = index;
    });
  },*/
                    ),
                    itemCount: Carsollist!.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.network(
                          "http://10.0.2.2:8000${Carsollist![index].image}");
                    }),
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
              ),
              child: Text("Best Stores"),
            ),
            /*Carsollist == null
                ? cardsLoading()
                :*/ Container(
                    height: 200,
                    //padding: EdgeInsets.only(left: 50,right: 50),
                   // margin: EdgeInsets.only(left: 50,right: 50),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {

                        return Container(
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
                            child:Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(65.0),topLeft: Radius.circular(65.0),bottomLeft: Radius.circular(15.0),bottomRight: Radius.circular(15.0))),
                         // shadowColor: Colors.grey,

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Container(

                                  child: CircleAvatar(
                                    child: CircleAvatar(

                                      child: CircleAvatar(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage("https://picsum.photos/id/1/200/300"),
                                          radius: 50.0,
                                          backgroundColor: Colors.grey,
                                          foregroundColor: Colors.grey,

                                        ),
                                        radius: 51,
                                        backgroundColor: Colors.black,
                                      ),
                                      radius:53.0 ,
                                      backgroundColor: Colors.white,
                                    ),
                                    radius: 55.0,
                                    backgroundColor: Colors.indigo,
                                  ),
                                  padding: EdgeInsets.only(top: 4,left: 2,right: 2),
                                  // decoration: BoxDecoration(
                                  //   color: Colors.white,
                                  //   shape: BoxShape.circle,
                                  //   boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,spreadRadius: 3)]
                                  // ),

                                ),
                                Spacer(),
                                Center(child: Text("Store Name",style: TextStyle(color: Colors.blue.shade800)),),
                                Spacer(),
                                Center(child: Text("@Store Name",style: TextStyle(color: Colors.grey,fontSize: 10)),),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Container(
                                      child: RatingBar(
                                        initialRating: 3.0,
                                        itemCount: 5,
                                        allowHalfRating: true,
                                        direction: Axis.horizontal,
                                        ratingWidget:RatingWidget(full:Image.asset("Images/FullStar.png"), half: Image.asset("Images/HalfStar-2.png"), empty: Image.asset("Images/EmptyStar.png")) ,
                                        onRatingUpdate: (value) {
                                         setState(() {
                                           Rating = value;
                                         });

                                        },
                                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                        itemSize: 15.0,
                                      ),
                                      margin: EdgeInsets.only(left: 5,bottom: 5),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(child: Text(Rating != null?Rating.toString(): '*?',),margin: EdgeInsets.only(bottom: 5,right:5),)
                                  ],
                                )
                              ],
                          ),

                        ),
                            );
                      },
                    ),
                  ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 100),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: 10,
                bottom: 10,
              ),
              child: Text("Best Product",style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 100),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: 10,
                bottom: 10,
              ),
              child: Text("Catogry 1"),
            ),

            Container(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160,
                    padding: EdgeInsets.only(left: 5),
                    child: Card(
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        side: BorderSide(color: Colors.grey.withOpacity(0.4))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                             Container(

                               margin: EdgeInsets.only(left: 5,top: 5),
                               child: Text("NIKE"),
                             ),
                              Container(
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.4),
                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                                ),
                                margin: EdgeInsets.only(right: 5,top: 5),
                                child: Center(child: Text("%25",style: TextStyle(color: Colors.green))),
                              ),

                            ],
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            width: 140,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                child: Image.network("https://fastly.picsum.photos/id/6/5000/3333.jpg?hmac=pq9FRpg2xkAQ7J9JTrBtyFcp9-qvlu8ycAi7bUHlL7I",fit: BoxFit.fitHeight,)

                            ),
                          ),
                          Spacer(),
                        Container(
                           alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 5,top: 5,right: 5),
                          child: Text("Store Name",style: TextStyle(color: Colors.blue,fontSize: 13  ),),
                        ),
                          Spacer(),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 5,top: 5,right: 5),
                            child: Text("MacBookAir",style: TextStyle(color: Colors.grey,fontSize: 13),),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                             Container(

                                 child: Text("\$2000",style: TextStyle(fontSize: 13),),
                               margin: EdgeInsets.only(left: 5),
                             ),
                              SizedBox(width: 5),
                              Text("1000",style: TextStyle(color: Colors.red,decoration: TextDecoration.lineThrough,decorationColor: Colors.red,fontSize: 13),)
                            ],
                          ),
                          Spacer(),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5,bottom: 5),
                                child: RatingBar(
                                  initialRating: 3.0,
                                  itemCount: 5,
                                  allowHalfRating: true,
                                  direction: Axis.horizontal,
                                  ratingWidget:RatingWidget(full:Image.asset("Images/FullStar.png"), half: Image.asset("Images/HalfStar-2.png"), empty: Image.asset("Images/EmptyStar.png")) ,
                                  onRatingUpdate: (value) {
                                    setState(() {
                                      Rating = value;
                                    });

                                  },
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                  itemSize: 10.0,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Icon(FontAwesomeIcons.solidComment,size: 15,color: Colors.blue),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5,right: 5),
                                child: Text("100",style: TextStyle(fontSize: 10,color: Colors.grey),),
                              )
                            ],
                          )
                        ],
                      )

                    ),
                  );
                },

              ),
            )




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
          height: 70.0.h,
          child: Row(
            children: [
              SizedBox(
                width: 40.w,
              ),
              IconButton(
                  onPressed: () {
                    print(Carsollist!.length.toString());
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
              onPressed: () {},
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
