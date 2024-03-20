
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/API_Backend/ApiPost.dart';
import 'data/API_Backend/Provider/CreatAccountProvider.dart';


const KIconAppbarColor =Color(0xFF7E84A3);
const KBlueColor =  Color(0xFF384AEB);
const KIconcardColor = Color(0xFF000000);
const KGreyColor1 = Color(0xFFE7E7E7);
const KGreyColor2 = Color(0xFFB7B7B7);
const KGreyColor3 = Color(0xFF9B9B9B);
const KGreyColor4 = Color(0xFF707070);
const KredColor4 = Color(0xFFFF8A8A);
const KgreenColor4 = Color(0xFF34DD34);






const String ApiProductsUrl = "/api/";
const String variants = "/variants";
const String comments = "/comments";
const String rating = "/rating";
const String add_to_cart = "/add_to_cart";
  String Slug = "";
  String? id ;
  int theNumber = 1;
  int cartCountnumbers = 0;
  int Idcart = 0;
  int cartnumber = 1;
  String TOkedns = 'Bearer 67|45XeXqbpODHD8MAebsJzPF9eHuGXL29nfjgj1QxD';



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
final KOnbordingScreenBold = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: KGreyColor3,);
final KTextOnbordingScreen = TextStyle(
  fontSize: 11,
  color: KGreyColor3);

