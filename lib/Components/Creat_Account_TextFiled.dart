import 'package:fexmonths/Home_display/the_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Creat_Account_TextFiled extends StatelessWidget {
  const Creat_Account_TextFiled({
    Key? key,
    required this.hintText,
    required this.obscureText,
    /* required this.onchangess*/ required this.controlers,
  }) : super(key: key);
  final String hintText;
  // final Function(String) onchangess;
  final bool obscureText;
  final TextEditingController controlers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        // onChanged: onchangess,
        /*(varss) {
          //  Password = varss;
        }*/
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          fillColor: Color(0xFFF2F4F8),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0.r),
              borderSide: BorderSide.none),
        ),
        obscureText: obscureText,
        controller: controlers,
      ),
    );
  }
}
