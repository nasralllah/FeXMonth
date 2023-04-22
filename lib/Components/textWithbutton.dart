import 'package:flutter/material.dart';

import '../Prudoct_display/CardCommnents.dart';
import 'Blue_Button.dart';
class textWithbutton extends StatelessWidget {
  const textWithbutton({
    Key? key, required this.labelText, required this.onTap, required this.Width, required this.Marginleftbuttoon,
  }) : super(key: key);
  final VoidCallback onTap;
  final String labelText;
  final double Width;
  final double Marginleftbuttoon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[ Stack(
        children: [Container(
          width: Width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))
          ),
          margin: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
          child: Container(
            margin: EdgeInsets.only(left: 12,top: 11),
              child: Text(labelText,style: TextStyle(color: Colors.white,fontSize: 16),))
        ),
          Blue_Button(ButtonText: "Select", height: 32, width: 80, Margintop: 18.5, Marginleft: Marginleftbuttoon ,textStyle: TextStyle(color: Colors.blue), buttonColor: MaterialStatePropertyAll<Color>(Colors.white),onTap:onTap, Marginbottom: 0 ,)

        ]
      ),
    ]
    );
  }
}