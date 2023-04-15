import 'package:dio/dio.dart';
import 'package:fexmonths/API_Backend/Provider/CarsolProvider.dart';
import 'package:fexmonths/Home_display/Carsoul_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../API_Backend/Models/productsDetails.dart';
import '../API_Backend/Provider/productDetailsProvider.dart';
import '../Components/Chose_Colores_Cirlcle.dart';
import '../Components/DynamicComments.dart';
import '../Components/Rating_Widget.dart';
import '../Home_display/the_main_screen.dart';
import 'CardCommnents.dart';
import 'CardDetels.dart';
import 'CardRating.dart';
import 'CardVariants.dart';

int activedots = 0;
int imglist = 4;
int addToCart = 0;
double? Rating;
bool cadrVisibleDetails = true;
bool cadrVisibleVarents = false;
bool cardVisibleComments = false;
bool cardVisibleRating = false;

class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

enum Catogerys { details, vairants, Comments, Rating ,heart}

enum circleColor { red, blue, green }

Catogerys? SelectCatogry;
circleColor? SelectColor;

const Active = Colors.blue;
const inactive = Colors.white;

class _SingleProductState extends State<SingleProduct> {
  final controller = PageController(viewportFraction: 0.8, keepPage: false);
  List<productsDetails>? productsDetailsList;
  Color hearColors = Colors.white;

  @override
  void initState() {
    productDetailsProvider(Dio()).getAll().then((value) {
      setState(() {});
      productsDetailsList = [];
      productsDetailsList!.addAll(value);
      print(
          '==========================================================================================');
      print(value);
      print(
          '==========================================================================================');
    });
  }

  void heatColor(){
    setState(() {

    if (hearColors== Colors.white ){
      hearColors = Colors.blue;
    }
    else
      hearColors = Colors.white;
    });


  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          body: SingleChildScrollView(
            child: GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  Navigator.pop(context);
                  print(details.primaryVelocity);
                }
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: CarouselSlider.builder(
                          itemCount: imglist,
                          options: CarouselOptions(
                            height: 180,
                            viewportFraction: 1,
                            enlargeCenterPage: false,
                            onPageChanged: (index,
                                reason) => /*productsDetailsList![index].pictures.pictures.length = index*/ "",
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
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Image.network(
                              // productsDetailsList![index].pictures.pictures.toString()
                              "https://www.goldenhaven.com.ph/wp-content/uploads/2022/02/Different-Steps-of-Product-Quality-Management.jpg",
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
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
                          clipBehavior: Clip.none,
                          padding: EdgeInsets.symmetric(),
                          child: IconButton(
                              onPressed:
                                  () => /*Navigator.pop(context)*/ productsDetailsList![0].id,
                              icon: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.blue,
                              ))),
                      GestureDetector(
                        onTap: () => setState(() {
                          SelectCatogry == Catogerys.heart;
                        }),
                        child: Container(
                          margin: EdgeInsets.only(left: 320),
                            clipBehavior: Clip.none,
                            padding: EdgeInsets.symmetric(),
                            child: IconButton(
                              onPressed: () {
                                heatColor();
                              },
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  color: hearColors,
                                )
                            )
                        ),
                      ),
                      SingleChildScrollView(
                        physics: PageScrollPhysics(),
                        child: Container(
                          margin: const EdgeInsets.only(top: 160.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade100),
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0))),
                          child: Column(
                            children: [
                              Center(
                                heightFactor: 4,
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: imglist,
                                  effect: const SwapEffect(
                                      dotHeight: 6, dotWidth: 6, spacing: 10),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                      child: Text('Nike Shose',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.grey.shade700)),
                                      margin: EdgeInsets.only(left: 40)),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 110, top: 4),
                                    child: Icon(FontAwesomeIcons.solidComment,
                                        size: 15, color: Colors.blue),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 9, top: 4),
                                    child: Text(
                                      "100",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      child: Text('Nike Shose',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade700)),
                                      margin: EdgeInsets.only(left: 40, top: 10)),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 4, left: 60),
                                    child: Rating_widget(
                                      initialRating: Rating?? 3.7,
                                      ignoreGestures: true,
                                        direction: Axis.horizontal,
                                        itemSizw: 20.0,
                                        semetricPadding: 2.0,
                                        onRatingUpdate: (value) {
                                          setState(() {
                                            Rating = value;
                                          });
                                        }),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 5, top: 4),
                                    child: Text(
                                        Rating != null ? Rating.toString() : "",
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 35, top: 10),
                                    child: const Icon(
                                      Icons.store_mall_directory_outlined,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: const Text(
                                          "StoreNamae",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 20),
                                        child: const Text(
                                          "StoreNamae",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 35),
                                    child: Text("\$100.00"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, top: 4),
                                    child: Text(
                                      "\$149.00",
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          SelectCatogry = Catogerys.details;
                                          if (SelectCatogry ==
                                              Catogerys.details) {
                                            cadrVisibleDetails = true;
                                            cadrVisibleVarents = false;
                                            cardVisibleComments = false;
                                            cardVisibleRating = false;

                                          }
                                        });
                                      },
                                      child: Container(
                                          //margin: EdgeInsets.only(left: 35),
                                          height: 30,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: SelectCatogry ==
                                                      Catogerys.details
                                                  ? Active
                                                  : inactive,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                )
                                              ]),
                                          child: Center(
                                            child: Text("Details",
                                                style: TextStyle(
                                                  color: SelectCatogry ==
                                                          Catogerys.details
                                                      ? Colors.white
                                                      : Colors.black,
                                                )),
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          SelectCatogry = Catogerys.vairants;
                                          cadrVisibleVarents = true;
                                          cadrVisibleDetails = false;
                                          cardVisibleComments = false;
                                          cardVisibleRating = false;

                                        });
                                      },
                                      child: Container(
                                          //  margin: EdgeInsets.only(),

                                          height: 30,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: SelectCatogry ==
                                                      Catogerys.vairants
                                                  ? Active
                                                  : inactive,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                )
                                              ]),
                                          child: Center(
                                              child: Text("vairants",
                                                  style: TextStyle(
                                                    color: SelectCatogry ==
                                                            Catogerys.vairants
                                                        ? Colors.white
                                                        : Colors.black,
                                                  )))),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          SelectCatogry = Catogerys.Comments;
                                          cardVisibleComments = true;
                                          cadrVisibleVarents = false;
                                          cadrVisibleDetails = false;
                                          cardVisibleRating = false;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: SelectCatogry ==
                                                    Catogerys.Comments
                                                ? Active
                                                : inactive,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              )
                                            ]),
                                        child: Center(
                                            child: Text("Comments",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: SelectCatogry ==
                                                          Catogerys.Comments
                                                      ? Colors.white
                                                      : Colors.black,
                                                ))),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          SelectCatogry = Catogerys.Rating;
                                          cardVisibleRating = true;
                                          cardVisibleComments = false;
                                          cadrVisibleVarents = false;
                                          cadrVisibleDetails = false;

                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color:
                                                SelectCatogry == Catogerys.Rating
                                                    ? Active
                                                    : inactive,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              )
                                            ]),
                                        child: Center(
                                            child: Text(
                                          "Rating",
                                          style: TextStyle(
                                            color:
                                                SelectCatogry == Catogerys.Rating
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CardDetels(),
                              CardVarints(),
                              cardComments(),
                              cardRating(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                border: Border.all(color: Colors.grey.shade400),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      //offset: Offset(0, -1),
                      spreadRadius: 4,
                      blurRadius: 30)
                ]),
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 35),
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: const Center(
                        child: Icon(
                      FontAwesomeIcons.commentDots,
                      color: Colors.blue,
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addToCart++;
                      print(addToCart);
                    });
                  },
                  child: Container(
                    //color: Colors.red,
                    child: SizedBox.square(
                      dimension: 30,
                      child: Icon(CupertinoIcons.plus_app,
                          size: 30, color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                  child: Text('$addToCart',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      addToCart--;
                      print(addToCart);
                    });
                  },
                  child: Container(
                    //color: Colors.red,
                    child: SizedBox.square(
                      dimension: 30,
                      child: Icon(CupertinoIcons.minus_rectangle,
                          size: 30, color: Colors.blue),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ]),
                    child: const Center(
                        child: Text(
                      "ADD TO CART",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
