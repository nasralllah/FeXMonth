import 'package:fexmonths/API_Backend/Provider/CarsolProvider.dart';
import 'package:fexmonths/Home_display/Carsoul_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../Components/Rating_Widget.dart';
import '../Home_display/the_main_screen.dart';

int activedots = 0;
int imglist = 4;
double? Rating;
class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  final controller = PageController(viewportFraction: 0.8, keepPage: false);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children:[ Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount:imglist,

                      options: CarouselOptions(
                        height: 180,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) => activedots = index,
                        /*aspectRatio: 1,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: true,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.4,
                        scrollDirection: Axis.horizontal,*/
                      ),
                      itemBuilder: (BuildContext context, int index, int realIndex)
                      {
                        return Image.network(
                          'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return carsoulLoadin();
                          },
                        );
                      },

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(),
                      child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.blue,))),

                  Container(
                    height: 400,
                    margin: const EdgeInsets.only(top: 160.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))
                    ),
                    child: Column(
                      children: [
                        Center(
                          heightFactor: 4,
                          child:  SmoothPageIndicator(
                            controller: controller,
                            count: imglist,
                            effect: const SwapEffect(
                              dotHeight: 6,
                              dotWidth: 6,
                              spacing: 10
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(

                                child: Text('Nike Shose',style: TextStyle(fontSize: 30,color: Colors.grey.shade700)),
                              margin: EdgeInsets.only(left: 40)
                            ),
                            Container(

                              margin: const EdgeInsets.only(left: 110,top: 4),
                              child: Icon(FontAwesomeIcons.solidComment,size: 15,color: Colors.blue),
                            ),
                            Container(

                              margin: const EdgeInsets.only(left: 9,top: 4),

                              child: Text("100",style: TextStyle(fontSize: 10,color: Colors.grey),),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Container(

                                child: Text('Nike Shose',style: TextStyle(fontSize: 20,color: Colors.grey.shade700)),
                                margin: EdgeInsets.only(left: 40,top: 10)
                            ),
                            Container(

                              margin: const EdgeInsets.only(top: 4,left: 60),
                              child: Rating_widget(direction: Axis.horizontal,itemSizw: 20.0,semetricPadding: 2.0, onRatingUpdate: (value) { setState(() {
                                Rating  = value;

                              }); }),
                            ),
                            Container(

                              margin: const EdgeInsets.only(left: 5,top: 4),

                              child: Text("${Rating}",style: TextStyle(fontSize: 10,color: Colors.grey),),
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35,top: 10),
                              child:  Icon(Icons.store_mall_directory_outlined,color: Colors.blue,size: 40,),

                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: const Text("StoreNamae",style: TextStyle(color: Colors.blue,fontSize: 15,fontStyle: FontStyle.italic),),
                                ),
                                Container(

                                  padding: EdgeInsets.only(right:  20),
                                  child: const Text("StoreNamae",style: TextStyle(color: Colors.blue,fontSize: 10),),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 35) ,
                              child: Text("\$100.00"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,top: 4) ,
                              child: Text("\$149.00",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.red ,fontSize: 10,fontWeight: FontWeight.bold), ),
                            ),

                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),

              ],

            ),
          )),
    );
  }
}
