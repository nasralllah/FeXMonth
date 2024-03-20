import 'package:fexmonths/Home_display/the_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constens.dart';

class Creat_Account_TextFiled extends StatelessWidget {
  const Creat_Account_TextFiled({
    Key? key,
    required this.hintText,
    required this.obscureText,

    /* required this.onchangess*/ required this.controlers, required this.Globelhey, required this.Validator, required this.onChange,
  }) : super(key: key);
  final String hintText;
  final GlobalKey Globelhey;
  final FormFieldValidator Validator;
  final Function(String) onChange;
  // final Function(String) onchangess;
  final bool obscureText;
  final TextEditingController controlers;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: Globelhey,
        child: TextFormField(
          controller: controlers,
          obscureText:obscureText ,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Color(0xFFF2F4F8),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0.r),
                borderSide: BorderSide(
                    color: KGreyColor1,
                    style: BorderStyle.none
                )
            ),
          ),

          validator: Validator,
          onChanged: onChange ,
        ),
      ),
    );
  }
}
