
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fexmonths/Home_display/Carsoul_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/API_Backend/Models/news.dart';
import '../../utils/app_constants.dart';




class Carsol_Slider extends StatelessWidget {
  const Carsol_Slider({
    Key? key,
    required this.CarsolList, required this.itemCount,
  }) : super(key: key);

  final List<News>? CarsolList;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
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
        itemCount: itemCount,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            child:FadeInImage(
              fadeInCurve: Curves.bounceIn,

              placeholder: AssetImage("Images/Group 5.png"),
              placeholderFit: BoxFit.cover,
              fit: BoxFit.cover,
              image: NetworkImage(AppConstants.BASE_URL+"${CarsolList![index].image.toString()}"),
              imageErrorBuilder: (context, error, stackTrace) => carsoulLoadin(),
              placeholderErrorBuilder: (context, error, stackTrace){
                return CircularProgressIndicator();
              },

            )
              //
          );
        });
  }
}