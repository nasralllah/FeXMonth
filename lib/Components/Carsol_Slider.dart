
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fexmonths/Home_display/Carsoul_loading.dart';
import 'package:flutter/cupertino.dart';

import '../API_Backend/Models/Catogry_Models.dart';
import '../API_Backend/Models/news.dart';


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
          return Image.network(
              "http://10.0.2.2:8000${CarsolList![index].image}",
              loadingBuilder: ( BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                if(loadingProgress == null){
                  return child;
                }
                return carsoulLoadin();

              });
        });
  }
}