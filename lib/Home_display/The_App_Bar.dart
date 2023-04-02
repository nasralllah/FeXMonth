import 'package:flutter/material.dart';
import 'package:fexmonths/Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fexmonths/Home_display/the_main_screen.dart';


class App_Baar extends StatelessWidget {
  const App_Baar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          //color: Colors.red,
          // alignment: Alignment.centerLeft,
           padding: EdgeInsets.only(top: 40.h, left: 5.w),
           icon: Icon(
             icon== true? Icons.menu: Icons.arrow_back,

           ),
            color: KIconAppbarColor, onPressed: () { icon == true; print(icon);},

        ),
        Container(
          //color: Colors.red,
          // alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 40.h, left: 15.w),
          child: Icon(
            Icons.notifications_on_outlined,
            color: KIconAppbarColor,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40.h, left: 30.w),
          child: Image(
            //   alignment:Alignment.center,
            image: AssetImage("Images/Group 5.png"),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          //  alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 40.h, left: 25.w),
          child: Icon(
            Icons.shopping_bag_outlined,
            color: KIconAppbarColor,
          ),
        ),
        Container(
          // alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 40.h, left: 25.w),
          child: Icon(
            Icons.search,
            color: KIconAppbarColor,
          ),
        ),
      ],
    );
  }
}
