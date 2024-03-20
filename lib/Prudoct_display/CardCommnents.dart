import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constens.dart';
import '../data/API_Backend/Provider/SendcommnetProvider.dart';
import '../utils/app_constants.dart';
import '../view/base_widget/Blue_Button.dart';
import '../view/base_widget/DynamicComments.dart';
import '../view/base_widget/Rating_Widget.dart';
import 'Single_Product.dart';

//final myController = TextEditingController();

class cardComments extends StatefulWidget {
  const cardComments({
    Key? key,
  }) : super(key: key);

  @override
  State<cardComments> createState() => _cardCommentsState();
}

TextEditingController commentController = TextEditingController();
final now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);
class _cardCommentsState extends State<cardComments> {

  // final date= DateFormat.yMMMMd().format(now);
  @override
  //List<DynamicComments> listCommentsa = [];
  double Rating= 1;
  List<DynamicComments> listComments = [];
  DateTime now = DateTime.now();
  String formatDate = DateFormat.yMMMEd().format(DateTime.now());
  addComments() {
    setState(() {
      listComments.add(
          DynamicComments(
            widget: Text(formatDate),
            Texts: Text(
                commentController.text),
            Imagee: "Images/profile.png",
            UserName: AppConstants.USER,
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cardVisibleComments,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                          controller: commentController,
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
                        onTap: (){
                          addComments();
                          SendCommment();
                        },
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
             CommentsList == null?
                Container()
               :Container(
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
      ]
    )
    )
    );
  }
}
/*
addComment() {
  setState(() {
    listCommentsa.add(DynamicComments(
      widget: Text("$date",style: TextStyle(fontSize: 9)),
      Texts: Text( CommentsList![0].comment ),
      Imagee: CommentsList![0].writer.profile_picture,
      UserName:  CommentsList![0].writer.writer_name,
    ));
  });
}*/
