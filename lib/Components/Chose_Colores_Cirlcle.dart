
import 'package:flutter/material.dart';

import '../Prudoct_display/Single_Product.dart';
class Cirical_Widget_Color extends StatefulWidget {
   Cirical_Widget_Color({
    Key? key, required this.Visible, required this.Image,this.GradientColor, this.onTap, required this.height,required this.width, required this.paddingLeft
  }) : super(key: key);
  final bool Visible;
  final Widget Image;
   Gradient? GradientColor;
   VoidCallback? onTap;
  final double height;
   final double width;
   final double paddingLeft;


   @override
  State<Cirical_Widget_Color> createState() => _Cirical_Widget_ColorState();
}


class _Cirical_Widget_ColorState extends State<Cirical_Widget_Color> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4, left: widget.paddingLeft, right: 10),
      child:  CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.indigo,
        child: CircleAvatar(
          radius: 28.0,
          backgroundColor: Colors.white,
          child:  GestureDetector(
             onTap: widget.onTap,
              child: Container(
                  height:53,
                  width: 53,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: widget.GradientColor /*LinearGradient(
                        begin:Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.red,
                          Colors.red.shade50,
                        ]
                    ),*/

                  ),
                  child: Visibility(
                    visible:widget.Visible ,
                    child: Center(
                      child: Stack(
                          children: [
                            Container(height: widget.height,width:widget.width,child:widget.Image/* Image.asset("Images/Path 577.png",opacity: const AlwaysStoppedAnimation(.5),fit: BoxFit.fill,)*/),
                          ]

                      ),
                    ),
                  )
              )
          ),
        ),
      ),
    );
  }
}