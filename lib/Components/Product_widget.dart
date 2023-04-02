import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Product_Widgit extends StatelessWidget {
  const Product_Widgit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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

                  margin: EdgeInsets.only(left: 10,top: 5),
                  child: Text("NIKE"),
                ),
                Container(
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(3.0))
                  ),
                  margin: EdgeInsets.only(right: 10,top: 5),
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
              width: 130,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  child: Image.network("https://fastly.picsum.photos/id/6/5000/3333.jpg?hmac=pq9FRpg2xkAQ7J9JTrBtyFcp9-qvlu8ycAi7bUHlL7I",fit: BoxFit.fitHeight,)

              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10,top: 5,right: 5),
              child: Text("Store Name",style: TextStyle(color: Colors.blue,fontSize: 13  ),),
            ),
            Spacer(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10,top: 5,right: 5),
              child: Text("MacBookAir",style: TextStyle(color: Colors.grey,fontSize: 13),),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Container(

                  child: Text("\$2000",style: TextStyle(fontSize: 13),),
                  margin: EdgeInsets.only(left: 10),
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
                  margin: EdgeInsets.only(left: 10,bottom: 5),
                  child: RatingBar(
                    initialRating: 3.0,
                    itemCount: 5,
                    allowHalfRating: true,
                    direction: Axis.horizontal,
                    ratingWidget:RatingWidget(full:Image.asset("Images/FullStar.png"), half: Image.asset("Images/HalfStar-2.png"), empty: Image.asset("Images/EmptyStar.png")) ,
                    onRatingUpdate: (value) {
                       /*setState(() {
                      Rating = value;
                    });*/

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

    );
  }
}