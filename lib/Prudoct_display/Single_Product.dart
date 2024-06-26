import 'dart:async';

import 'package:dio/dio.dart';

import 'package:fexmonths/Home_display/Carsoul_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Constens.dart';
import '../Home_display/the_main_screen.dart';
import '../data/API_Backend/CommentsProvider.dart';
import '../data/API_Backend/Models/CommentModel.dart';
import '../data/API_Backend/Models/CommentRatingModel.dart';
import '../data/API_Backend/Models/SingleProductModel.dart';
import '../data/API_Backend/Provider/AddToCartProvider.dart';
import '../data/API_Backend/Provider/SingleProductProvider.dart';
import '../data/API_Backend/Provider/src/GetCoomentProvider.dart';
import '../view/base_widget/Rating_Widget.dart';
import '../view/base_widget/loading_widget.dart';
import '../view/base_widget/plusAndminusWidget.dart';
import 'CardCommnents.dart';
import 'CardDetels.dart';
import 'CardRating.dart';
import 'CardVariants.dart';

int activedots = 0;
int imglist = 4;
//int addToCart = 0;
int? notifaiCart;
double? Rating;
bool cadrVisibleDetails = true;
bool cadrVisibleVarents = false;
bool cardVisibleComments = false;
bool cardVisibleRating = false;

class SingleProduct extends StatefulWidget {
  var Slugg;

  SingleProduct({required this.Slugg, Key? key}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

enum Catogerys { details, vairants, Comments, Rating }

enum heart { blue, white }

enum circleColor { red, blue, green }

heart? Selectheart;
Catogerys? SelectCatogry;
circleColor? SelectColor;

const Active = Colors.blue;
const inactive = Colors.white;
List<SingleProductModel>? SingleProductModelList;
List<Comments> CommentsList = [];


class _SingleProductState extends State<SingleProduct> {
  final controller = PageController(viewportFraction: 0.8, keepPage: false);
  Timer? _timer;

  Color hearColors = Colors.blue;

  @override
  void initState() {
    _timer = Timer(Duration(seconds: 1), () {
      setState(() {
        theNumber;
      });
    });

    SingleProductProvider(Dio()).getAll(Slug: widget.Slugg).then((value) {
      setState(() {});
      SingleProductModelList = [];
      SingleProductModelList?.add(value);

      print(SingleProductModelList![0].pictures);
      print(value);
      print(
          '==========$Slug==============lkads;fkda;lfshdsfhsadfhafhdfhjdfjdfjadshjadfsfsdjldfsdsh===================SingleProductModelList======================SingleProductModelList=========================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
      print(
          '===========================================================================');
    });
    CommentsProvider(Dio()).getAll(Slug: Slug).then((value) {
      CommentsList = [];
      CommentsList.add(value);
      print(
          '======CommentsList==================CommentsList========================CommentsList=============================CommentsList=============');
      print(value);
      print(
          '==========$Slug==============CommentsList===================CommentsList=====================CommentsList========================');
    });

  }


  void heatColor() {
    setState(() {
      if (hearColors == Colors.blue) {
        hearColors = Colors.red;
      } else
        hearColors = Colors.blue;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          body: SingleProductModelList== null ? Center(child: getloading3(context),): SingleProductModelList?.length==0 ?Center(child: Text('this product has been deleted '),):SingleChildScrollView(
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
                            itemCount: SingleProductModelList!.length,
                            options: CarouselOptions(
                                height: 180,
                                viewportFraction: 1,
                                enlargeCenterPage: false,
                                onPageChanged: (index, reason) {},
                                scrollDirection: Axis.horizontal
                                /*productsDetailsList![index].pictures.pictures.length = index*/
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
                            itemBuilder: (context, index, realIndex) =>
                                Image.network(
                                  // productsDetailsList![index].pictures.pictures.toString()
                                  /* "http://10.0.2.2:8000${SingleProductModelList![index].pictures}*/
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzWTTnEpu2pPbAjH2ps-MW4nsjUrmn3gNlgA&usqp=CAU',
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return carsoulLoadin();
                                  },
                                )),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.blue,
                              )),
                        ],
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 160),
                                    child: SmoothPageIndicator(
                                      controller: controller,
                                      count: imglist,
                                      effect: const SwapEffect(
                                          dotHeight: 6,
                                          dotWidth: 6,
                                          spacing: 10),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 80),
                                    clipBehavior: Clip.none,
                                    padding: EdgeInsets.symmetric(),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          heatColor();
                                        });
                                        print("hiiiiiiiiiiiii");
                                      },
                                      icon: Icon(Icons.favorite_border),
                                      color: hearColors,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Text(
                                          '${SingleProductModelList![0].attributes.title}',
                                          style: TextStyle(
                                              fontSize: 27,
                                              color: Colors.grey.shade700))),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 110, top: 4),
                                    child: Icon(FontAwesomeIcons.solidComment,
                                        size: 15, color: Colors.blue),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 9, top: 4),
                                    child: const Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 40, top: 10),
                                      child: Text(
                                          "${SingleProductModelList![0].store.store_name}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade700))),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 4, left: 60),
                                    child: Rating_widget(
                                        initialRating: Rating ?? 3.7,
                                        ignoreGestures: true,
                                        direction: Axis.horizontal,
                                        itemSizw: 15.0,
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
                                        padding: EdgeInsets.only(right: 5),
                                        child: Text(
                                          "@${SingleProductModelList![0].store.store_name}",
                                          style: const TextStyle(
                                              color: Colors.blue, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 35),
                                    child: Text(
                                        "\$${SingleProductModelList![0].attributes.price}"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, top: 4),
                                    child: SingleProductModelList?[0]
                                                .attributes
                                                .discount ==
                                            null
                                        ? Container()
                                        : Text(
                                            "\$${SingleProductModelList![0].attributes.discount}",
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
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
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              boxShadow: const [
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
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              boxShadow: const [
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
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            boxShadow: const [
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
                                            color: SelectCatogry ==
                                                    Catogerys.Rating
                                                ? Active
                                                : inactive,
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            boxShadow: const [
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
                                            color: SelectCatogry ==
                                                    Catogerys.Rating
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
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                border: Border.all(color: Colors.grey.shade400),
                boxShadow: const [
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
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: const Center(
                        child: Icon(
                      FontAwesomeIcons.commentDots,
                      color: Colors.blue,
                    )),
                  ),
                ),
                plusAndminusWidget(),
                GestureDetector(
                  onTap: () {
                    addToCart(context);
                    print(theNumber);
                  },
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: const [
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
