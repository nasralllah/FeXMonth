import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';

Widget getloading3(BuildContext context){
  return
    Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.transparent,
            height: 25,width: 25,
            child:       LoadingBouncingLine.circle(

                borderColor: Colors.white,
                borderSize: 3.0,
                size: 25,
                backgroundColor: Colors.grey,
                duration: Duration(milliseconds: 1000)
            ),
          ),
        ));

}