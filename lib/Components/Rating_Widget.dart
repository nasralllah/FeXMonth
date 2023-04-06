
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating_widget extends StatelessWidget {
  const Rating_widget({
    Key? key, required this.itemSizw, required this.semetricPadding, this.onRatingUpdate,  this.direction,
  }) : super(key: key);
  final double itemSizw;
  final double semetricPadding ;
  final dynamic onRatingUpdate;
  final dynamic direction;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 3.0,
      itemCount: 5,
      allowHalfRating: true,
      direction: direction,
      ratingWidget: RatingWidget(
          full: Image.asset("Images/FullStar.png"),
          half:
          Image.asset("Images/HalfStar-2.png"),
          empty:
          Image.asset("Images/EmptyStar.png")),
      onRatingUpdate: onRatingUpdate, /*(value) {
        *//*setState(() {
          Rating = value;
        });*//*
      },*/
      itemPadding:
      EdgeInsets.symmetric(horizontal:semetricPadding),
      itemSize: /*15.0*/ itemSizw,
    );
  }
}