import 'package:flutter/material.dart';

import '../Prudoct_display/CardCommnents.dart';
import 'Blue_Button.dart';
class textWithbutton extends StatelessWidget {
   textWithbutton({
    Key? key, required this.title, required this.onTap, required this.Width, required this.Marginleftbuttoon,
    this.Cost,this.time, required this.Margin
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final double Width;
  final double Marginleftbuttoon;
  late  String? Cost;
  late String? time;
  final EdgeInsets Margin;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[ Stack(
        children: [Container(
          width: Width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))
          ),
          margin: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: Margin,
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(title,style: TextStyle(color: Colors.white,fontSize: 16),)),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 12),
                      padding: EdgeInsets.only(bottom: 5),
                      child: Cost == null?Container():Text(Cost!,style: TextStyle(color: Colors.white,fontSize: 16),)),
                  Container(
                      margin: EdgeInsets.only(left: 12),
                      padding: EdgeInsets.only(bottom: 5),
                      child: time == null?Container():Text(time!,style: TextStyle(color: Colors.white,fontSize: 16),)),
                ],
              )
            ],
          )
        ),
          Blue_Button(ButtonText: "Select", height: 32, width: 80, Margintop: 23.5, Marginleft: Marginleftbuttoon ,textStyle: TextStyle(color: Colors.blue), buttonColor: MaterialStatePropertyAll<Color>(Colors.white),onTap:onTap, Marginbottom: 0, MarginRight: 0 ,)

        ]
      ),
    ]
    );
  }
}