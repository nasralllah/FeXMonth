import 'package:fexmonths/Components/Rating_Widget.dart';
import 'package:flutter/material.dart';

import '../API_Backend/Provider/SendCommentRating.dart';
import '../Components/Blue_Button.dart';
import '../Components/DynamicComments.dart';
import 'Single_Product.dart';

final myControllerRating = TextEditingController();

class cardRating extends StatefulWidget {
  const cardRating({
    Key? key,
  }) : super(key: key);

  @override
  State<cardRating> createState() => _cardRatingState();
}
double? Ratingg;

class _cardRatingState extends State<cardRating> {
  List<DynamicComments> listComments = [];

  addComments() {
    setState(() {
      listComments.add(DynamicComments(
        widget: Rating_widget(
            direction: Axis.horizontal,
            itemSizw: 10,
            semetricPadding: 1,
            ignoreGestures: true,
            initialRating: 1),
        Texts: Text(
            myControllerRating.text == null ? "" : myControllerRating.text),
        Imagee: '',
        UserName: '',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: cardVisibleRating,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 13, right: 13, top: 25),
                height: 200,
                width: double.infinity,
                child: Card(
                  shadowColor: Colors.grey.shade200,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Text('Based on 27 Reviews',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold)),
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 15),
                            child: Text('Overall',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 40),
                            child: Text('3.7',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.blue.shade600,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 90),
                            child: Text('( 27 Reviews )',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                )),
                          ),
                          Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 5),
                                  child: Text('5 Star',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, right: 5),
                                    child: Rating_widget(
                                        direction: Axis.horizontal,
                                        itemSizw: 17,
                                        semetricPadding: 1,
                                        ignoreGestures: true,
                                        initialRating: 5.0)),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 35),
                                  child: Text('05',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 5),
                                  child: Text('4 Star',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, right: 5),
                                    child: Rating_widget(
                                        direction: Axis.horizontal,
                                        itemSizw: 17,
                                        semetricPadding: 1,
                                        ignoreGestures: true,
                                        initialRating: 4.0)),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 35),
                                  child: Text('09',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 5),
                                  child: Text('3 Star',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, right: 5),
                                    child: Rating_widget(
                                        direction: Axis.horizontal,
                                        itemSizw: 17,
                                        semetricPadding: 1,
                                        ignoreGestures: true,
                                        initialRating: 3.0)),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 35),
                                  child: Text('04',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 5),
                                  child: Text('2 Star',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, right: 5),
                                    child: Rating_widget(
                                        direction: Axis.horizontal,
                                        itemSizw: 17,
                                        semetricPadding: 1,
                                        ignoreGestures: true,
                                        initialRating: 2.0)),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 35),
                                  child: Text('07',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 5),
                                  child: Text('1 Star',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, right: 5),
                                    child: Rating_widget(
                                        direction: Axis.horizontal,
                                        itemSizw: 17,
                                        semetricPadding: 1,
                                        ignoreGestures: true,
                                        initialRating: 1.0)),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 35),
                                  child: Text('02',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                          ]),
                        ],
                      )
                      /*  Container(
                    margin: EdgeInsets.only(left: 20,top: 15),
                    child: Text('Overall',style: TextStyle(fontSize: 20,color: Colors.grey.shade600,fontWeight: FontWeight.bold)),
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20,top: 5),
                        child: Text('3.7',style: TextStyle(fontSize: 40,color: Colors.blue.shade600,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 5),
                    child: Text('3.7',style: TextStyle(fontSize: 40,color: Colors.blue.shade600,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 5),
                    child: Text('( 27 Reviews )',style: TextStyle(fontSize: 13,color: Colors.grey.shade600,)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child: Text("asdf")
                  )*/
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 39, top: 15),
                child: Text('Add a Review',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40, top: 5),
                    child: Text("Your Rating :",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade500)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 5),
                    child: Rating_widget(
                        onRatingUpdate: (value) {
                          Ratingg = value;
                          print(Ratingg);
                        },
                        direction: Axis.horizontal,
                        itemSizw: 20,
                        semetricPadding: 1,
                        ignoreGestures: false,
                        initialRating: 0.0),
                  ),
                ],
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 305,
                            height: 40,
                            margin: EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            child: TextField(
                              controller: myControllerRating,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(30.0),
                                        left: Radius.circular(30.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  labelText: "A new Comment"),
                            ),
                          ),
                          Blue_Button(
                            ButtonText: 'Send',
                            height: 30,
                            width: 60,
                            Margintop: 20,
                            Marginleft: 260,
                            onTap:(){
                              addComments();
                              SendReview();},
                            textStyle: TextStyle(color: Colors.white),
                            buttonColor:
                                MaterialStatePropertyAll<Color>(Colors.blue),
                            Marginbottom: 0,
                            MarginRight: 0,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: false,
                        primary: true,
                        itemCount: listComments.length,
                        itemBuilder: (_, index) => listComments[index]),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
