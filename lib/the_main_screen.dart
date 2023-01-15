import 'package:flutter/material.dart';
import 'Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


int activedots = 0;
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
class homepagecontent extends StatefulWidget {
  const homepagecontent({Key? key}) : super(key: key);

  @override
  State<homepagecontent> createState() => _homepagecontentState();
}

class _homepagecontentState extends State<homepagecontent> {
  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.0.h,horizontal: 1.0.w),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0.w),
                /*Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: buuldindecator(),
                  ),
                ),*/
              ],
            )),
      ),
    ))
        .toList();
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
          flexibleSpace:
           Row(
           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
             Container(
               //color: Colors.red,
             // alignment: Alignment.centerLeft,
               margin: EdgeInsets.only(top: 40.h,left: 70.w),
               child: Icon(
                 Icons.notifications_on_outlined,
                 color: KIconAppbarColor,
               ),
             ),
               Container(
                 margin:  EdgeInsets.only(top: 40.h,left: 60.w),
                 child: Image(
              //   alignment:Alignment.center,
                   image: AssetImage("Images/Everything Everywhere All At Once (2022).jpg"),
                 fit: BoxFit.cover,
                 ),
               ),
               Container(
               //  alignment: Alignment.centerRight,
                 margin: EdgeInsets.only(top: 40.h,left: 50.w),
                 child: Icon(
                     Icons.notifications_on_outlined,
                   color: KIconAppbarColor,

                 ),
               ),
               Container(

                // alignment: Alignment.centerRight,
                 margin: EdgeInsets.only(top: 40.h,left: 50.w),
                 child: Icon(
                     Icons.notifications_on_outlined,
                   color: KIconAppbarColor,

                 ),
               ),
             ],
           )
       ),
   body: Column(
     children: [
       Container(
       child: CarouselSlider(
         options: CarouselOptions(
           animateToClosest: true,
           autoPlay: true,
           aspectRatio: 2.0,
           enlargeCenterPage: true,
           onPageChanged: (index, reason) {
             setState(() {
               activedots = index;
             });
           },

         ),
         items: imageSliders,
       ),
     ), buuldindecator(),
    ]
   ),
    );
  }

 Widget buuldindecator() => AnimatedSmoothIndicator(
   activeIndex: activedots,
   count: imgList.length,
   effect: SwapEffect(

     dotHeight: 10,
     dotWidth: 10,
   ),
 );

}
