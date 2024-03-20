import 'package:fexmonths/Constens.dart';
import 'package:flutter/material.dart';

import '../view/base_widget/Blue_Button.dart';
import '../view/base_widget/textWithButtonOrders.dart';
import 'invoiceOrders.dart';

class myOreders extends StatefulWidget {
  const myOreders({Key? key}) : super(key: key);

  @override
  State<myOreders> createState() => _myOredersState();
}

class _myOredersState extends State<myOreders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("My Orders", style: TextStyle(color: Colors.blue)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Serch",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  ),
                  Blue_Button(
                    ButtonText: "Search",
                    height: 30,
                    width: 70,
                    Margintop: 34.5,
                    Marginleft: 255,
                    textStyle: TextStyle(color: Colors.white),
                    buttonColor: MaterialStatePropertyAll<Color>(Colors.blue),
                    Marginbottom: 0,
                    MarginRight: 0,
                  )
                ],
              )
            ],
          ),
          Container(
            height: 412,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Row(children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.only(left: 13),
                    child: Text("${index + 1} ."),
                  ),
                  Stack(children: [
                    Container(
                      width: 310,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border.all(color: Colors.blue)),
                      child: Container(
                          margin: EdgeInsets.only(left: 270),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline))),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: 280,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(30.0),
                                  left: Radius.circular(30.0))),
                          margin: EdgeInsets.only(
                              top: 0, bottom: 10, left: 0, right: 0),
                          child: Container(
                              margin: EdgeInsets.only(left: 60, top: 10),
                              child: Text(
                                "234234234",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ))),
                    ),
                    Container(
                        width: 80,
                        height: 39,
                        margin: EdgeInsets.only(left: 195, top: 5, bottom: 0),
                        child: TextButton(
                          onPressed: () => Null,
                          onLongPress: () => Null,
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(3),
                              shadowColor: MaterialStatePropertyAll(
                                  Colors.blue.shade800),
                              //  side: MaterialStatePropertyAll(BorderSide(color: Colors.blue)),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.white),
                              shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(30),
                                          right: Radius.circular(30))))),
                          child: Text("Shipping",
                              style: TextStyle(color: KBlueColor)),
                        )),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20, top: 30),
                                child: Text("\$1359",
                                    style: TextStyle(color: Colors.white))),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Text("Today, 12th Feb ,2018",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9))),
                          ],
                        )
                      ],
                    )
                  ]),
                ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
