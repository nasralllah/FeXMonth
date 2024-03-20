
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


import 'Blue_Button.dart';
import 'Chose_Colores_Cirlcle.dart';
class DynamicComments extends StatelessWidget {
  const DynamicComments({
    Key? key, required this.widget, required this.Texts, required this.Imagee, required this.UserName,
  }) : super(key: key);
final Widget widget;
final Widget Texts;
final String Imagee;
final String UserName;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Cirical_Widget_Color(Visible: true, Image: Image.asset(Imagee), height: 55,width: 55, paddingLeft: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child:  Text(UserName)),
                  Container(child: widget )

                ],
              ),
                Blue_Button(ButtonText: 'Report', height: 30, width: 60, Margintop: 0,Marginleft: 89, textStyle: TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue), Marginbottom: 0, MarginRight: 0,)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10,right: 5,left: 5,bottom:10),
            child:Texts,
          ),
          Divider(
            color: Colors.grey.shade300,
            indent: 10,
            endIndent: 10,
          )
        ],
      ),
    );
  }
}