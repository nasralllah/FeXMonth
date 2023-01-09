import 'package:fexmonths/the_main_screen.dart';
import 'package:flutter/material.dart';
class Creat_Account_TextFiled extends StatelessWidget {
  const Creat_Account_TextFiled({
    Key? key, required this.hintText,required this.obscureText, required this.onchangess,
  }) : super(key: key);
  final String hintText;
  final Function(String) onchangess;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:50 ,
      child: TextField(
        onChanged: onchangess,
        /*(varss) {
          //  Password = varss;
        }*/
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,

          fillColor: Color(0xFFF2F4F8),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
        ),
        obscureText: obscureText,
      ),
    );
  }
}