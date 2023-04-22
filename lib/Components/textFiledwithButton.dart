import 'package:flutter/material.dart';

import '../Prudoct_display/CardCommnents.dart';
import 'Blue_Button.dart';
class textFiledWithbutton extends StatelessWidget {
  const textFiledWithbutton({
    Key? key, required this.labelText, this.ontap, this.controller,
  }) : super(key: key);

  final String labelText;
  final VoidCallback? ontap;
  final dynamic controller;
   @override
  Widget build(BuildContext context) {
    return Row(
      children: [Stack(
        children: [Container(
          width: 305,
          height: 40,
          margin: EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30.0),
                      left: Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: labelText),
          ),
        ),
          Blue_Button(onTap:ontap ,ButtonText: "Apply", height: 32, width: 80, Margintop: 18.5, Marginleft: 240 ,textStyle: TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue), Marginbottom: 0,)
     ]
     )]
    );
  }
}