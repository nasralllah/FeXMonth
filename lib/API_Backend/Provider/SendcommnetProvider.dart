import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fexmonths/Prudoct_display/CardCommnents.dart';


//1|vHNAis0nbSbgARPrkW40FL3EdJNSsfFhrJpTVM3Z


Future<void> sendComment({required String Slug,required String Comment}) async{


  final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/products/$Slug/comments'),
      headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        "Authorization":" Bearer 6|8zBn8miY1llHkpLpAY7Z7oYPHUM4lVR23k3ELmVl"
      },

      body: jsonEncode(<String,dynamic>{
        'comment' :commentController.text
      })
  );
  if (response.statusCode == 200){
    print(response.toString());

  }
  else{
    print(response.statusCode);
    print(response.headers);

    print(Slug);
  }






}
