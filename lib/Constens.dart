
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
const KIconAppbarColor =Color(0xFF7E84A3);
const KButtonsignColor =  Color(0xFF3E21DE);
const KIconcardColor = Color(0xFF000000);
const String ApiProductsUrl = "http://10.0.2.2:8000/api/";
const String variants = "/variants";
const String comments = "/comments";
const String rating = "/rating";
const String add_to_cart = "/add_to_cart";
  String Slug = "";
  String? id ;
  int theNumber = 1;
  int cartCountnumbers = 0;
  int Idcart = 0;

final KTextCardStyled =  TextStyle(
  fontSize: 20.sp,
  color: Colors.white,);

final KTextButtonStyled = TextStyle(
 fontSize: 15.sp,
color: Colors.white,);

final KTextOnbordingScreenBold = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.grey.shade600,);

final KTextOnbordingScreen = TextStyle(
  fontSize: 12,
  color: Colors.grey,);

