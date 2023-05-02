import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Home_display/Carsoul_loading.dart';
import 'Rating_Widget.dart';

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
  }) : super(key: key);
  final String title;
  final String ImageNetwork;
  final String StoreName;
  final String discount;
  final String status;
  final int Price;
  var cost;

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.grey,
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
                discount ==null
                    ? Container()
                    : Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        margin: EdgeInsets.only(right: 10, top: 5),
                        child: Center(
                            child: Text("$discount",
                                style: TextStyle(color: Colors.green))),
                      ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: 130,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  child: Image.network(
                    ImageNetwork,
                    fit: BoxFit.fitHeight,
                  )),
            ),
            Spacer(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, top: 5, right: 5),
              child: Text(
                StoreName,
                style: TextStyle(color: Colors.blue, fontSize: 13),
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, top: 5, right: 5),
              child: Text(
                status,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "$Price",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "$cost",
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      fontSize: 13),
                )
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
                      size: 15, color: Colors.blue),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "100",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
