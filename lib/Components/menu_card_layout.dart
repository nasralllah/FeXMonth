import 'package:flutter/material.dart';
import 'package:fexmonths/Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menu_Cards extends StatelessWidget {
  const Menu_Cards({
    Key? key,
    required this.onpress,
    required this.Icons,
    required this.CardName,
  }) : super(key: key);

  final VoidCallback onpress;
  final IconData Icons;
  final String CardName;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(right: 100.w),
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onpress,
          child: SizedBox(
            height: 70.h,
            width: 400.w,
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Icon(
                      Icons,
                      color: Colors.white,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      CardName,
                      style: KTextCardStyled,
                    )),
              ],
            ),
          ),
        ));
  }
}
