import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'Rating_Widget.dart';
import '/Constens.dart';
import 'loading_widget.dart';

class Product_Widgit extends StatelessWidget {
  Product_Widgit({
    Key? key,
    required this.title,
    required this.ImageNetwork,
    required this.StoreName,
    required this.discount,
    required this.status,
    required this.Price,
    required this.cost,
    required this.Comments
  }) : super(key: key);
  final String title;
  final String ImageNetwork;
  final String StoreName;
  final int? discount;
  final String status;
  final int Price;
  var cost;
  final int Comments;

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: KGreyColor1,
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
                  child: Text(title),
                ),
                discount == null ? Container() : Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: KgreenColor4.withOpacity(0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        margin: EdgeInsets.only(right: 10, top: 5),
                        child: Center(
                            child: Text("$discount",style: TextStyle(color: KgreenColor4))),

                      ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                  //color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: 130,
              height: 100,
              child:  ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  child: FadeInImage(
                    fadeInCurve: Curves.bounceIn,

                    placeholder: AssetImage("Images/Group 5.png"),
                    placeholderFit: BoxFit.cover,
                    fit: BoxFit.cover,
                    image: NetworkImage(ImageNetwork),
                    imageErrorBuilder: (context, error, stackTrace) => Center(child: getloading3(context)),
                    placeholderErrorBuilder: (context, error, stackTrace){
                      return Center(child: getloading3(context));
                    },

                  )
              ),

            ),
            Spacer(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, top: 5, right: 5),
              child: Text(
                StoreName,
                style: TextStyle(color: KBlueColor, fontSize: 13),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(discount == null)...[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "$Price",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ]
                else...[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "$discount",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "$Price",
                    style: TextStyle(
                        color: KredColor4,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: KredColor4,
                        fontSize: 13),
                  )
                ]
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
                      size: 15, color: KBlueColor),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "$Comments",
                    style: TextStyle(fontSize: 10, color: KGreyColor3),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
