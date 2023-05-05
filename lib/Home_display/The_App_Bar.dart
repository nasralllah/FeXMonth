import 'package:flutter/material.dart';
import 'package:fexmonths/Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fexmonths/Home_display/the_main_screen.dart';

import '../Prudoct_display/Single_Product.dart';
import 'CartDisplay.dart';

class App_Baar extends StatefulWidget {
  const App_Baar({
    Key? key,
  }) : super(key: key);

  @override
  State<App_Baar> createState() => _App_BaarState();
}


class _App_BaarState extends State<App_Baar> {
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
            icon == true ? Icons.menu : Icons.arrow_back,
          ),
          color: KIconAppbarColor,
          onPressed: () {
            icon == true;
            print(icon);
          },
        ),
        Container(
          //color: Colors.red,
          // alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 40.h, left: 15.w),
          child: const Icon(
            Icons.notifications_on_outlined,
            color: KIconAppbarColor,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40.h, left: 30.w),
          child: const Image(
            //   alignment:Alignment.center,
            image: AssetImage("Images/Group 5.png"),
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart(),));
            print("carttttt");
          },
          child: Stack(
            children: [
              Container(

                //  alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 40.h, left: 20.w),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: KIconAppbarColor,
                ),
                width: 30,
              ),
              Visibility(
                visible: false,
                child: Positioned(
                  width: 15,
                  height: 15,
                  top: 30.h,
                  left: 35.w,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                   /* margin: EdgeInsets.only(top: 30.h, left: 40.w),*/
                    child: Center(child: Text('$cartCountnumbers}',style: TextStyle(color: Colors.white,fontSize: 9,fontWeight: FontWeight.bold),)),
                  ),
                ),
              )
            ],
          )
        ),
        Container(
      //    color: Colors.red,
          // alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 40.h, left: 25.w),
          child: const Icon(
            Icons.search,
            color: KIconAppbarColor,
          ),
        ),
      ],
    );
  }
}
