import 'package:flutter/material.dart';

import '../view/base_widget/Rating_Widget.dart';


class Faevirot_Page extends StatefulWidget {
  const Faevirot_Page({Key? key}) : super(key: key);

  @override
  State<Faevirot_Page> createState() => _Faevirot_PageState();
}

class _Faevirot_PageState extends State<Faevirot_Page> {
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
        title: const Text("My Favorite", style: TextStyle(color: Colors.blue)),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {});
            },
            key: Key("hi"),
            background: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              width: 300,
              height: 100,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                            'https://10.0.1.1:8000/ss7.vzw.com/is/image/VerizonWireless/apple-iphone-13-starlight-09142021?wid=465&hei=465&fmt=webp',
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              "Iphone 13 pro",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            margin:
                                EdgeInsets.only(top: 5, left: 10, bottom: 12),
                            child: Text(
                              "Al merri Store",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic),
                            )),
                        Rating_widget (
                          initialRating: 3,
                          ignoreGestures: true,
                          itemSizw: 15,
                          semetricPadding: 1,
                          direction: Axis.horizontal,
                        )
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          /*Container(
                           height: 30,
                           width: 30,
                           margin: EdgeInsets.only(left: 60, top: 5),
                           child: IconButton(
                               highlightColor: Colors.transparent,
                               splashColor: Colors.transparent,
                               padding: EdgeInsets.all(0),
                               alignment: Alignment.topRight,
                               onPressed: () {

                                 print("hiiiiiiiiii");
                               },
                               icon: Icon(
                                 Icons.cancel,
                                 color: Colors.blue,

                               ))),*/
                          Container(
                            margin: EdgeInsets.only(
                                right: 5, top: 20, bottom: 2, left: 50),
                            child: Text(
                              "\$500",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // cartDisplaylist[0].product.discount == null?Container():
                          Container(
                            margin:
                                EdgeInsets.only(right: 5, top: 10, bottom: 2),
                            child: Text(
                              "\$1000",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
